module Fitter
  module Repositories
    def self.[](entity_name)
      __instances__.fetch_or_store(entity_name) { const_get(:"#{entity_name}Repo").new }
    end

    def self.__instances__
      @__instances__ ||= Concurrent::Map.new
    end
  end
end