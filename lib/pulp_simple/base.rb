module PulpSimple
  class Base
    attr_accessor :pulp_resource_name

    self.class::DEFINED_METHODS = {}

    def initialize(pulp_resource_name=nil)
      @pulp_resource_name = pulp_resource_name
    end

    def method_missing(meth, *args, &block)
      method_name = meth.to_s
      args = args.first
      if method_def = self.class::DEFINED_METHODS[method_name]
        rest_url = full_url(method_name, method_def)
        call_rest_method(method_name, rest_url, method_def[:http_method], args)
      else
        super
      end
    end

    protected

    def call_rest_method(method_name, rest_url, http_method, args)
      args = args.to_json if args
      begin
        JSON.parse RestClient.send(http_method, rest_url, args)
      rescue JSON::ParserError
        ''
      end
    end

    def short_class_name
      self.class.name.to_s.sub(/^.*::/, '')
    end

    def base_url
      "#{PulpSimple.base_url}/#{short_class_name.downcase}"
    end

    def full_url(method_name, method_def)
      url = base_url
      url += "/#{@pulp_resource_name}" if @pulp_resource_name
      url_method_name = method_def[:url_method_name] || method_name
      url += "/#{url_method_name}" unless (url_method_name.nil? || url_method_name.empty?)
      url += '/'
    end

  end

end

