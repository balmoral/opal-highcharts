module Highcharts

  # http://api.highcharts.com/highcharts#Chart

  class Chart
    include Base
    include Native

    def initialize(x_or_native)
      if native?(x_or_native)
        super(x_or_native)
      else
        log "#{self.class.name}##{__method__}:#{__LINE__} : arg_options=#{x_or_native}"
        options = x_or_native.to_h.dup
        log "#{self.class.name}##{__method__}:#{__LINE__} : options=#{options}"
        case mode = options.delete(:mode)
          when :chart
            super(`new Highcharts.Chart( #{ options.to_n } )`)
          when :stock
            super(`new Highcharts.StockChart( #{ options.to_n } )`)
          when :map
            raise UnsupportedFeature, "chart mode : '#{mode}' (Highcharts.Map)"
            # super(`new Highcharts.Map( #{ options.to_n } )`)
          else
            raise ArgumentError, "invalid chart mode '#{mode}'"
        end
      end
    end

    alias_native :add_axis, :addAxis
    alias_native :add_series, :addSeries
    alias_native :add_series_as_drilldown, :addSeriesAsDrilldown
    alias_native :container
    alias_native :drill_up, :drillUp
    alias_native :export_chart, :exportChart
    alias_native :get
    alias_native :get_svg, :getSVG
    alias_method :svg, :get_svg
    alias_native :redraw
    # alias_native :set_title, :setTitle
    alias_native :options, :options, as: Options
    alias_native :renderer, :renderer, as: Renderer # see http://api.highcharts.com/highcharts#Renderer
    alias_native :series, :series, array: Series

    # eg. title and subtitle should be either nil, string or { text: 'abc' } and any other title options
    def set_title(title = nil, subtitle = nil, redraw = true)
      title = { text: title } if title.is_a?(String)
      subtitle = { text: subtitle } if subtitle.is_a?(String)
      `console.log(#{"#{self.class.name}##{__method__}(#{title}, #{subtitle}, #{redraw})"})`
      `#{self.to_n}.setTitle(#{title}, #{subtitle}, #{redraw})`
    end
  end
end
