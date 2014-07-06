module Serve #:nodoc:  
  class CoffeeHandler < FileTypeHandler #:nodoc:
    extension 'coffee'
    
    def parse(input, context)
      engine = Tilt::CoffeeScriptTemplate.new { input }
      engine.render
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
