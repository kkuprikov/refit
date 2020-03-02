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
        'lib/fitter/views/assets'
      ]
    end

    Hanami::View.configure do
      root 'lib/fitter/views/templates'
      layout :application
    end

    Hanami::View.load!
    # Hanami::Assets::Precompiler.run
  end
end