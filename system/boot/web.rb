Fitter::Application.boot(:web) do |app|
  init do
    require "hanami-router"
    require "hanami-controller"
    require 'slim'
    require 'hanami-view'
    require 'hanami-helpers'
    require 'hanami/assets'

    Hanami::Assets.configure do
      compile true

      sources << [
        'lib/fitter/assets'
      ]
    end

    Hanami::Assets.load!
    Hanami::Assets.deploy

    Hanami::View.configure do
      root 'lib/fitter/views/templates'
      layout :application
    end

    Hanami::View.load!
  end
end