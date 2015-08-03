module Highcharts

  # Returned by Chart#options
  class Config
    include Native
    alias_native :colors
    alias_native :symbols
    alias_native :lang
    alias_native :global
    alias_native :chart
  end

end
