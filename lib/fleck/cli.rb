require 'thor'
require 'fleck'

module Fleck
  # Command-line interface
  class CLI < Thor
    include Thor::Actions

    desc "search [TERM]", "Search files"
    method_option :search_tool, aliases: '-t', default: 'grep'
    method_option :inflectors, aliases: '-i', kind: Array
    method_option :exclude, aliases: '-e', kind: Array
    def search(term)
      search = Search.for term, options

      if search.results.any?
        search.results.each do |inflection|
          say ">> #{inflection.name}:"
          inflection.results.each { |result| say result }
        end
      else
        say "No results found"
      end
    end

    desc :replace, "Replace files"
    def replace(search_object, replace_term, inflections)
      Replace.perform \
        search: search_object,
        term: replace_term,
        inflections: inflections
    end

    protected
    # Show the usage and command help.
    def usage
      %(
        Fleck v#{Fleck.version}

        Usage: fleck [SEARCH_TERM] -r [REPLACE_TERM] -t [SEARCH_TOOL]
      )
    end

    private
    def replace?
      options[:replace_with].present? &&
      ask?("Replace #{search.results.count} results? (y/n)") == 'y'
    end
  end
end
