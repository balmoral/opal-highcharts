module Highcharts

  class Chart
    include Base
    include Native

    def initialize(arg_options)
      log "#{self.class.name}##{__method__}:#{__LINE__} : arg_options=#{arg_options}"
      options = arg_options.to_h.dup
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

    # @!method redraw(options)
    alias_native :redraw

    # @!method set_title(title, subtitle)
    alias_native :set_title, :setTitle

    # @!method options
    # @return [Options]
    alias_native :options, :options, as: Options

    # @!method series
    # @return [array of Series]
    alias_native :series, :series, array: Series
    # def series
    #   Native(`#{self.to_n}.series`).map {|e|
    #     log "#{self.class.name}##{__method__}:#{__LINE__} : calling Series.new(#{e})"
    #    Series.new(e)
    #  }
    #end

  end
end
