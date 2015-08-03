module Highcharts
  class Chart
    include Native

    def initialize(arg_options) #
      options = arg_options.to_h
      contain(options)
      case options.delete(:mode)
        when :stock
          super(`new Highcharts.Chart('StockChart', #{ options.to_n } )`)
        when :map
          super(`new Highcharts.Chart('Map', #{ options.to_n } )`)
        else
          super(`new Highcharts.Chart( #{ options.to_n } )`)
      end
    end

    # @!method redraw(options)
    alias_native :redraw

    # @!method set_title(title, subtitle)
    alias_native :set_title, :setTitle

    # @!method config
    # substitute for Highchart Chart.options
    # as options returned here is not same as options initially set
    # and thus confusing
    # @return [hash]
    def config
      Config.new(`#{self.to_n}.options`)
    end

    def series
      Native(`#{self.to_n}.series`).map {|e| Series.new(e)}
    end

    private

    def contain(options)
      # Get the id of the container or undefined
      id = `$(container).prop("id")`
      %x{
        console.log(
          #{
            "#{self.class.name}##{__method__}:#{__LINE__} : initial container id is '#{id}'"
          }
        )
      }
      # If the container id is undefined then
      # use the id in the chart options if present
      # otherwise set to a random id.
      unless id == nil || id == 'undefined'
        id = options[:id] || random_id
        %x{
          console.log(
            #{
              "#{self.class.name}##{__method__}:#{__LINE__} : char id is undefined - setting to '#{id}'"
            }
          )
        }
        `$(container).prop("id", id)`
      end

      # If :renderTo has been set in the options then it
      # should match the id of the container, otherwise
      # a Highcharts error #13 will occur. It should be
      # unique in the page. We do not check here.
      #
      # If :renderTo has not been set in the options then
      # it will be set here to the container id.
      unless options[:chart] && options[:chart][:renderTo]
        # Volt.logger.debug("#{self.class.name}##{__method__}:#{__LINE__} : setting chart_model._chart._renderTo = '#{id}'")
        (options[:chart] ||= {})[:renderTo] = id
      end
    end

    # Generate a unique id for chart container.
    def random_id
      "hc_#{(rand * 1000000000).to_i}"
    end
      
  end
end
