module Highcharts

  # http://api.highcharts.com/highcharts#Renderer
  class Renderer
    include Base
    
    alias_native :arc
    alias_native :circle
    alias_native :g
    alias_native :image
    alias_native :label
    alias_native :path
    alias_native :rect
    alias_native :text

  end  
end  