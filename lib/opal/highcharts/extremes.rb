module Highcharts

  # http://api.highcharts.com/highcharts#Axis.getExtremes
  class Extremes
    include Native
    
    alias_native :data_max, :dataMax
    alias_native :data_min, :dataMin
    alias_native :max, :max
    alias_native :min, :min

  end  
end  