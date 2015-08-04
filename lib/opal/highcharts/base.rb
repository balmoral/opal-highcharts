module Highcharts

  class UnsupportedFeature < RuntimeError; end

  module Base

    def log(s)
      %x{ console.log( #{ s } ) }
    end

  end
end