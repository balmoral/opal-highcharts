module Highcharts

  # http://api.highcharts.com/highcharts#Chart.options
  class Options
    include Base

    alias_native :colors
    alias_native :symbols
    alias_native :lang
    alias_native :global
    alias_native :chart
  end

end
