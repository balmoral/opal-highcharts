module Highcharts

  # http://api.highcharts.com/highcharts#Series
  class Series
    include Base

    alias_native :add_point, :addPoint
    alias_native :chart, :chart, as: Chart
    alias_native :data, :data, array: Point
    alias_native :hide
    alias_native :name
    alias_native :options # TODO: determine class for series options
    alias_native :remove
    alias_native :remove_point, :removePoint
    alias_native :select
    alias_native :selected
    alias_native :set_data, :setData
    alias_method :data=, :set_data
    alias_native :set_visible, :setVisible
    alias_native :show
    alias_native :type
    alias_native :update
    alias_native :visible
    alias_method :visible=, :set_visible
    alias_native :x_axis, :xAxis, as: Axis
    alias_native :y_axis, :yAxis, as: Axis

  end
end