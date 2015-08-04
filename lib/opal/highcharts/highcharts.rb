# http://api.highcharts.com/highcharts#Highcharts

module Highcharts
  extend Base

  def self.chart(options)
    Chart.new(options)
  end

  def self.charts
    Native(`Highcharts.charts`).map { |e| Chart.new(e) }
  end

  def self.date_format(format, time = nil, capitalize = false)
    `Highcharts.dateFormat(#{format}, #{time}, #{capitalize})`
  end

  def self.date_formats(*args, &block)
    raise UnsupportedFeature, 'Highcharts.dateFormats'
  end

  def self.number_format(number, decimals = nil, decimal_point = nil, thousands_sep = nil)
    `Highcharts.dateFormat(#{number}, #{decimals}, #{decimal_point}, #{thousands_sep})`
  end

  # Set global/default chart options (hash)
  def self.set_options(options)
    `Highcharts.setOptions( #{ options.to_n } )`
  end

  # Set global/default chart options (hash)
  def self.options=(options)
    set_options(options)
  end
end