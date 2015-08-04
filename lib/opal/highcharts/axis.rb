module Highcharts

  # http://api.highcharts.com/highcharts#Axis
  class Axis
    include Base
    
    alias_native :add_plot_band, :addPlotBand
    alias_native :add_plot_line, :addPlotLine
    alias_native :extremes, :getExtremes, as: Extremes
    alias_native :remove
    alias_native :remove_plot_band, :removePlotBand
    alias_native :remove_plot_line, :removePlotLine
    alias_native :set_categories, :setCategories
    alias_method :categories=, :set_categories
    alias_native :set_extremes, :setExtremes
    alias_method :extremes=, :set_extremes
    alias_native :set_title, :setTitle
    alias_method :title, :set_title
    alias_native :to_pixels, :toPixels
    alias_native :to_value, :toValue
    alias_native :update

  end  
end  