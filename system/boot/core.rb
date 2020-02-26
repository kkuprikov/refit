Fitter::Application.boot(:core) do
  init do
    require 'dry-validation'
    require 'dry/monads'
    require 'dry/monads/do'
    require 'dry/view'
    require 'slim'
  end

  start do
    Dry::Validation.load_extensions(:monads)
  end
end