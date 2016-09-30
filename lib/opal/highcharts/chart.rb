module Highcharts

  # Ruby wrapper for Highcharts.Chart.js
  #
  # @author Colin Gunn
  # @see http://api.highcharts.com/highcharts#Chart

  class Chart
    include Base

    # Creates a Highcharts or Highstock chart.
    #
    # @param [Hash,Native] options_or_native
    # If the argument is a native object it is wrapped
    # otherwise a new native chart is created and wrapped.
    # @option options_or_native [Symbol] :mode Either :chart, :stock, :map
    # @option options_or_native [Hash] :chart and others per Highcharts docs
    #
    # Highcharts.Map is not currently supported.
    #
    # @see http://api.highcharts.com/highcharts#chart
    # @see http://api.highcharts.com/highstock#chart
    def initialize(options_or_native)
      if native?(options_or_native)
        super(options_or_native)
      else
        options = options_or_native.to_h.dup
        case mode = options.delete(:mode) || :chart
          when :chart
            super(`new Highcharts.Chart( #{ options.to_n } )`)
          when :stock
            super(`new Highcharts.stockChart( #{ options.to_n } )`)
          when :map
            raise UnsupportedFeature, "#{__FILE__}[#{__LINE__}] #{self.class.name}##{__method__} : chart mode : '#{mode}' (Highcharts.Map)"
            # super(`new Highcharts.Map( #{ options.to_n } )`)
          else
            raise ArgumentError, "#{__FILE__}[#{__LINE__}] #{self.class.name}##{__method__} : invalid chart mode '#{mode}'"
        end
      end
    end

    # Adds an axis to the chart after render time.
    # @param options [Hash] axis configuration options
    # @param is_x [Boolean] optional, whether axis is X or Y axis, defaults to true
    # @param redraw [Boolean] optional, whether to redraw after adding axis, defaults to true
    # @param animation [Boolean,Hash] optional, whether to animate redraw, defaults to true
    # @see http://api.highcharts.com/highcharts#Chart.addAxis
    alias_native :add_axis, :addAxis

    # Adds a series to the chart after render time.
    # @param options [Hash] series configuration options
    # @param is_x [Boolean] optional, whether axis is X or Y axis, defaults to true
    # @param redraw [Boolean] optional, whether to redraw after adding axis, defaults to true
    # @param animation [Boolean,Hash] optional, whether to animate redraw, defaults to true
    # @see http://api.highcharts.com/highcharts#Chart.addSeries
    alias_native :add_series, :addSeries

    # Add a series to the chart as drilldown from a specific point in the parent series.
    # @see http://api.highcharts.com/highcharts#Chart.addSeriesAsDrilldown
    alias_native :add_series_as_drilldown, :addSeriesAsDrilldown

    # Returns a (native) reference to the containing HTML element.
    # @see http://api.highcharts.com/highcharts#Chart.container
    alias_native :container

    # Removes the chart and purges memory.
    # @see http://api.highcharts.com/highcharts#Chart.destroy
    alias_native :destroy, :destroy

    # When the chart is drilled down to a child series,
    # chart.drill_up will drill up to the parent series.
    # @see http://api.highcharts.com/highcharts#Chart.drillUp
    alias_native :drill_up, :drillUp

    # Exporting module required.
    # Submit an SVG version of the chart to a server
    # along with some parameters for conversion.
    # @see http://api.highcharts.com/highcharts#Chart.exportChart
    alias_native :export_chart, :exportChart

    # Returns a chart element for a given a id.
    # @see http://api.highcharts.com/highcharts#Chart.get
    # @param id [String] the id of the chart element as set in configuration options
    # @return [Axis,Series,Point,nil] the axis, series or point
    alias_native :get

    # Returns an SVG string representing the chart.
    # Highcharts exporting module required.
    # @see http://api.highcharts.com/highcharts#Chart.getSVG
    # @param options [Hash] additional options
    # @return [String]
    alias_native :get_svg, :getSVG
    alias_method :svg, :get_svg

    # Returns the current configuration options of the chart.
    # @see http://api.highcharts.com/highstock#Chart.options
    # @return [Highcharts::Options]
    alias_native :options, :options, as: Options

    # Redraw the chart after any changes have been made.
    # @param animation [Boolean,Hash] optional, whether to animate redraw, defaults to true
    # @see http://api.highcharts.com/highstock#Chart.redraw
    alias_native :redraw

    # Returns the renderer for the chart.
    # @see http://api.highcharts.com/highcharts#Renderer
    # @return [Highcharts::Renderer]
    alias_native :renderer, :renderer, as: Renderer

    # Set a new title or subtitle for the chart.
    # @param title [Hash] optional, configuration options for the title, default is nil
    # @param subtitle [Hash] subtitle optional, configuration options for the subtitle. default is nil
    # @param redraw [Boolean] optional, whether to redraw immediately, defaults to true
    # @see http://api.highcharts.com/highstock#Chart.setTitle
    alias_native :set_title, :setTitle

    # Returns an array of the series in the chart.
    # @see http://api.highcharts.com/highstock#Chart.series
    # @return [Array<Series>]
    alias_native :series, :series, as_array_of: Series # requires ##alias_native patch


    # Change the title (but not subtitle) of the chart.
    # @param string_or_hash [String,Hash]
    #   If a string, then only the title text will be changed.
    #   If a hash it should contain title options.
    # @param redraw [Boolean] optional, whether to redraw immediately, defaults to true
    # @see http://api.highcharts.com/highstock#Chart.setTitle
    def title=(string_or_hash, redraw = true)
      t = string_or_hash.is_a?(String) ? {text: string_or_hash} : string_or_hash.to_h
      set_title(t, nil, redraw)
    end

    # Change the subtitle (but not title) of the chart.
    # @param string_or_hash [String,Hash] string_or_hash
    #   If a string, then only the subtitle text will be changed.
    #   If a hash it should contain title options.
    # @param redraw [Boolean] optional, whether to redraw immediately, defaults to true
    # @see http://api.highcharts.com/highstock#Chart.setTitle
    def subtitle=(string_or_hash, redraw = true)
      t = string_or_hash.is_a?(String) ? {text: string_or_hash} : string_or_hash.to_h
      set_title(nil, t, redraw)
    end

  end

end
