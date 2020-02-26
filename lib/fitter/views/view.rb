module Fitter
  class View < Dry::View
    config.paths = [File.join(__dir__, "templates")]
    config.layout = "application"
  end
end