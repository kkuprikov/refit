require_relative '../entities'
require 'pry'

module Fitter
  module Repositories
    class Repository < ROM::Repository::Root
      include Import["container"]

      struct_namespace Fitter::Entities

      def all
        root.to_a
      end

      def first
        root.first
      end

      def last
        root.last
      end

      def by_id(id)
        root.by_pk(id).one
      end

      def create(attrs)
        root.changeset(:create, attrs).map(:add_timestamps).commit
      end

      def update(id, attrs)
        root.by_pk(id).changeset(:update, attrs).map(:touch).commit
      end

      def delete(id)
        root.by_pk(id).delete
      end

      def clear
        root.delete
      end

      def entity_class
        root.mapper.model
      end
    end
  end
end