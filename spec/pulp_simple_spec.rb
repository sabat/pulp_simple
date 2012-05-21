require 'spec_helper'
require 'pulp_simple'

describe PulpSimple do
  before(:all) do
    @config = { 'pulp_server' => 'test_pulp_server.gid.gap.com', 'pulp_username' => 'test_pulp_user', 'pulp_password' => 'test_pulp_password' }
  end

  after(:each) do
    PulpSimple.pulp_server = PulpSimple.pulp_username = PulpSimple.pulp_password = nil
  end

  it "has a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  context "Pulp Server" do
    it "lets you assign an explicit Pulp master server" do
      PulpSimple.stub(:config).and_return(@config)
      PulpSimple.pulp_server = 'foobar.gid.gap.com'
      PulpSimple.pulp_server.should == 'foobar.gid.gap.com'
    end

    it "uses a default for the Pulp master server if no explicit value is assigned" do
      PulpSimple.should_receive(:config).and_return(@config)
      PulpSimple.pulp_server.should == @config['pulp_server']
    end
  end

  context "Pulp User" do
    it "lets you assign an explicit Pulp user" do
      PulpSimple.stub(:config).and_return(@config)
      PulpSimple.pulp_username = 'foobar_user'
      PulpSimple.pulp_username.should == 'foobar_user'
    end
  
    it "uses a default for the Pulp user if no explicit value is assigned" do
      PulpSimple.should_receive(:config).and_return(@config)
      PulpSimple.pulp_username.should == @config['pulp_username']
    end
  end

  context "Pulp Password" do
    it "lets you assign an explicit Pulp password" do
      PulpSimple.stub(:config).and_return(@config)
      PulpSimple.pulp_password = 'foobar_password'
      PulpSimple.pulp_password.should == 'foobar_password'
    end
  
    it "uses a default for the Pulp password if no explicit value is assigned" do
      PulpSimple.should_receive(:config).and_return(@config)
      PulpSimple.pulp_password.should == @config['pulp_password']
    end
  end

  context "Base URL" do
    it "produces a valid base URL" do
      PulpSimple.should_receive(:config).exactly(3).times.and_return(@config)
      PulpSimple.base_url.should == "https://#{@config['pulp_username']}:#{@config['pulp_password']}@#{@config['pulp_server']}/pulp/api"
    end
  end
end

