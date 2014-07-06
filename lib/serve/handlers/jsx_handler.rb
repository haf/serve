module Serve #:nodoc:
  class JsxHandler < FileTypeHandler #:nodoc:
    extension 'jsx'

    # we know our extension
    def initialize path, templ
      super path, templ, 'jsx'
    end
    
    def parse(string, context)
      require 'react/jsx'
      React::JSX.compile(string)
    end
    
    def content_type
      'text/javascript'
    end

    def compiled_extension
      'js'
    end

    def layout?
      false
    end
  end
end
