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

  module Base

    def log(s)
      %x{ console.log( #{ s } ) }
    end

  end
end