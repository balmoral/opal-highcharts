module Highcharts

  class UnsupportedFeature < RuntimeError; end

  class Axis; end
  class Chart; end
  class Extremes; end
  class Highcharts; end
  class Options; end
  class Point; end
  class Renderer; end
  class Series; end

  module MonkeyPatches
    def alias_native(new, old = new, options = {})
      if klass = options[:array]
        define_method new do |*args, &block|
          if value = Native.call(@native, old, *args, &block)
            value.map{ |e| klass.new(e) }
          end
        end
      else
        super
      end
    end
  end

  module Base
    include Native
    extend MonkeyPatches

    def log(s)
      %x{ console.log( #{ s } ) }
    end

    def self.included(klass)
      klass.extend self
    end

  end
end

