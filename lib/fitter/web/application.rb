require "hanami/middleware/body_parser"

module Fitter
  module Web
    def self.app
      Rack::Builder.new do
        use Hanami::Middleware::BodyParser, :json
        run Fitter::Web::Router
      end
    end
  end
end