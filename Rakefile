require_relative 'config/application'
require 'rom-sql'
require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    Fitter::Application.start(:db)
    ROM::SQL::RakeSupport.env = ROM.container(Fitter::Application['db.config']) do |config|
      config.gateways[:default].use_logger(Logger.new($stdout))
    end
  end
end