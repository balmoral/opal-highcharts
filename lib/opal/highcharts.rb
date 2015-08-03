if RUBY_ENGINE == 'opal'
  require 'opal/highcharts/setup'
else
  require 'opal'
  require 'opal/highcharts/version'

  Opal.append_path File.expand_path('../..', __FILE__).untaint
end