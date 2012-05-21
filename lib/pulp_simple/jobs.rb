module PulpSimple
  class Jobs < PulpSimple::Base

    DEFINED_METHODS     = {
        'list'                    => { :http_method => :get, :url_method_name => '' },
        'info'                    => { :http_method => :get, :url_method_name => '' }
    }

  end

end

