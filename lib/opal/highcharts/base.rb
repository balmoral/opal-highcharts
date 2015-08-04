module Highcharts

  class UnsupportedFeature < RuntimeError; end

  module Base
    include Native
    extend Native

    def log(s)
      %x{ console.log( #{ s } ) }
    end

  end
end