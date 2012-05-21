module PulpSimple
  class ConsumerGroups < PulpSimple::Base

    DEFINED_METHODS = {
        'list'                   => { :http_method => :get, :url_method_name => '', :class_method_ok? => true },
        'info'                   => { :http_method => :get, :url_method_name => '' },
        'installpackages'        => { :http_method => :post },
        'uninstallpackages'      => { :http_method => :post },
        'updatepackages'         => { :http_method => :post },
        'add_key_value_pair'     => { :http_method => :post },
        'delete_key_value_pair'  => { :http_method => :post }
    }

  end

end

