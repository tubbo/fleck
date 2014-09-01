require 'active_model'

module Fleck
  # Search object, actually runs the query.
  class Search
    include ActiveModel::Model

    attr_accessor :query, :tool, :inflections

    def results
      inflected_search(query) || non_inflected_search
    end

    def inflected_queries
      inflections.reduce([query]) do |queries, inflection|
        queries << "#{query}".send(inflection)
      end
    end

    private
    def inflected_search(term)
      return nil unless inflections.present? && inflections.any?

      inflected_queries.reduce(non_inflected_search) do |results, inflected_term|
        results.merge inflected_term => search_on(inflected_term)
      end
    end

    def non_inflected_search
      { query => search_on(query) }
    end

    def search_on(term)
      `#{tool} #{term}`.split "\n"
    end
  end
end
