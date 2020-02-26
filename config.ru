require_relative 'config/application'

Fitter::Application.finalize!

run Fitter::Web.app