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

  module NativePatches
    extend Native::Helpers

    def alias_native(new, old = new, options = {})
      puts "#{name}###{__method__}:#{__LINE__}(#{new}, #{old}, #{options})"
      # `console.log(#{"#{name}###{__method__}:#{__LINE__}(#{new}, #{old}, #{options})"})`
      if old.end_with? ?=
        define_method new do |value|
          `#@native[#{old[0 .. -2]}] = #{Native.convert(value)}`
          value
        end
      elsif klass = options[:array]
        define_method new do |*args, &block|
          if value = Native.call(@native, old, *args, &block)
            value.map{ |e| klass.new(e) }
          end
        end
      else
        if as = options[:as]
          define_method new do |*args, &block|
            if value = Native.call(@native, old, *args, &block)
              as.new(value.to_n)
            end
          end
        else
          define_method new do |*args, &block|
            Native.call(@native, old, *args, &block)
          end
        end
      end
    end
  end

  module Base
    include Native

    def log(s)
      `console.log(#{s})`
    end

    def self.included(klass)
      #klass.extend Native::Helpers
      klass.extend NativePatches
    end

  end
end

