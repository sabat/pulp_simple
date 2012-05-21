module PulpSimple
  class Consumers < PulpSimple::Base

    DEFINED_METHODS     = {
        'list'                    => { :http_method => :get, :url_method_name => '' },
        'info'                    => { :http_method => :get, :url_method_name => '' },
        'package_profile'         => { :http_method => :get },
        'update_package_profile'  => { :http_method => :put, :url_method_name => 'package_profile' },
        'package_updates'         => { :http_method => :get },
        'repoids'                 => { :http_method => :get },
        'keyvalues'               => { :http_method => :get },
        'errata'                  => { :http_method => :get },
        'bind'                    => { :http_method => :post },
        'unbind'                  => { :http_method => :post },
        'add_key_value_pair'      => { :http_method => :post },
        'delete_key_value_pair'   => { :http_method => :post },
        'update_key_value_pair'   => { :http_method => :post },
        'history'                 => { :http_method => :post },
        'installpackages'         => { :http_method => :post },
        'uninstallpackages'       => { :http_method => :post },
        'updatepackages'          => { :http_method => :post },
        'installerrata'           => { :http_method => :post }
    }

  end

end

