module Highcharts

  class UnsupportedFeature < RuntimeError; end

  module Base
    include Native

    def log(s)
      %x{ console.log( #{ s } ) }
    end

  end
end