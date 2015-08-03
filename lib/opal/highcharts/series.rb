module Highcharts
  class Series
    include Native

    # @!method add_point(options, redraw=true, shift=false, animation=true)
    # @param options [Numeric|Array|Hash]
    #   options: Number|Array|Hash
    #     The point options.
    #     If options is a single number, a point with that y value is appended to the series.
    #     If it is an array, it will be interpreted as x and y values respectively.
    #     If it is an object, advanced options as outlined under series.data are applied.
    #   redraw: Boolean
    #     Defaults to true. Whether to redraw the chart after the point is added.
    #     When adding more than one point, it is highly recommended that the redraw
    #     option be set to false, and instead chart.redraw() is explicitly called after
    #     the adding of points is finished.
    #   shift: Boolean
    #     Defaults to false.
    #     When shift is true, one point is shifted off the start of the series as one is
    #     appended to the end. Use this option for live charts monitoring a value over time.
    #   animation: Mixed
    #     Defaults to true.
    #     When true, the graph will be animated with default animation options.
    #     The animation can also be a configuration object with properties duration and easing.
    alias_native :add_point, :addPoint


    # @!method data
    # Returns array containing the series' data point objects.
    # @return [Array]
    def data
      Native(`#{self.to_n}.data`)
    end

    # @!method hide
    # Hides the series if visible.
    # If the chart.ignoreHiddenSeries option is true,the chart is redrawn without this series.
    alias_native :hide

    # @!method name
    # @return [String]
    alias_native :name

  end
end