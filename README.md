## Ruby wrapper for the Highcharts.js and Highstock.js charting libraries

The goal of this project is to wrap the Highcharts and Highstock APIs in Opal, providing a nice Ruby interface to Highcharts' functionality.

To find out more about Highcharts, check out these links:

* Highcharts: http://www.highcharts.com/products/highcharts
* Highcharts Demos: http://www.highcharts.com/demo
* Highstock Demos: http://www.highcharts.com/stock/demo

To find out more about Opal, go to http://opalrb.org

## Installation

Install opal-highcharts from RubyGems:

```
$ gem install opal-highcharts
```

Or include it in your Gemfile for Bundler:

```ruby
gem 'opal-highcharts'
```

## Cloning this repository

```
$ git clone https://github.com/balmoral/opal-highcharts
```

## Getting Started

### Usage

`opal-highcharts` can be added to your opal application sources using a standard require:

```ruby
# app/application.rb
require 'opal'
require 'highcharts'
require 'opal-highcharts'
```

> **Note**: this file requires two important dependencies, `highcharts` and `opal-highcharts`.
> You need to bring your own `highcharts.js` file as the gem does not include one. If
> Download a copy from http://www.highcharts.com/download and place
> it into `app/` or whichever directory you are compiling assets from. 

## Getting involved

To contribute to this project, follow the steps below.

1. Fork the repo ( https://github.com/balmoral/opal-highcharts/fork )
2. Create your feature branch (`git checkout -b new-branch`)
3. Commit your changes (`git commit -am 'description of commit'`)
4. Push to the branch (`git push origin new-branch`)
5. Create a Pull Request

## Licenses

### Highcharts
is free for non-commercial use. See http://www.highcharts.com/ for details.

###opal-highcharts 
  see LICENSE.txt


