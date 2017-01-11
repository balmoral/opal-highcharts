# -*- encoding: utf-8 -*-
require File.expand_path('../lib/opal/highcharts/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name           = 'opal-highcharts'
  spec.version        = Opal::Highcharts::VERSION
  spec.authors        = [ 'Colin Gunn' ]
  spec.email          = [ 'colgunn@icloud.com' ]
  spec.homepage       = 'http://github.com/balmoral/opal-highcharts'
  spec.summary        = 'Ruby wrapper for Highcharts/Highstock JS.'
  spec.license        = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'opal'
end