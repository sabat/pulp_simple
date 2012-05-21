require 'rest-client'
require 'json'
require 'yaml'

require 'pulp_simple/version'
require 'pulp_simple/base'
require 'pulp_simple/consumers'
require 'pulp_simple/consumer_groups'
require 'pulp_simple/jobs'

module PulpSimple
  def self.pulp_server=(server)
    @pulp_server = server
  end

  def self.pulp_server
    @pulp_server ||= config['pulp_server']
  end

  def self.pulp_username=(username)
    @pulp_username = username
  end

  def self.pulp_username
    @pulp_username ||= config['pulp_username']
  end

  def self.pulp_password=(password)
    @pulp_password = password
  end

  def self.pulp_password
    @pulp_password ||= config['pulp_password']
  end

  def self.base_url
    "https://#{pulp_username}:#{pulp_password}@#{pulp_server}/pulp/api"
  end

  private

  def self.config
    YAML.load(File.read 'etc/pulp-simple-config.yml')
  end

end

