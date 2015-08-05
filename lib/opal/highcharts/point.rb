module Highcharts

  # http://api.highcharts.com/highcharts#Point
  class Point
    include Base
    
    alias_native :category
    alias_native :percentage
    alias_native :remove
    alias_native :select
    alias_native :selected
    alias_native :slice
    alias_native :total
    alias_native :update
    alias_native :x
    alias_native :y
    
  end

end  