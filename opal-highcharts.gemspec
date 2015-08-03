# -*- encoding: utf-8 -*-
require File.expand_path('../lib/opal/highcharts/version', __FILE__)

Gem::Specification.new do |s|
  s.name           = 'opal-highcharts'
  s.version        = Opal::Highcharts::VERSION
  s.authors        = [ 'Colin Gunn' ]
  s.email          = [ 'colgunn@icloud.com' ]
  s.homepage       = 'http://github.com/balmoral/opal-highcharts'
  s.summary        = 'Opal access to Highcharts and Highstock'
  s.description    = 'Opal DOM library for Highcharts and Highstock'
  s.license        = 'MIT'
  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ['lib']

  s.add_runtime_dependency 'opal', '>= 0.8.0', '< 0.9.0'
  s.add_development_dependency 'opal-rspec', '~> 0.4.0'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'rake'
end