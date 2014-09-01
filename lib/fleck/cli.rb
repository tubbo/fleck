require 'thor'
require 'fleck'

module Fleck
  # Command-line interface
  class CLI < Thor
    include Thor::Actions

    desc "search [TERM]", "Search files"
    method_option :search_tool, aliases: '-t', default: 'grep'
    method_option :replace_with, aliases: '-r'
    method_option :inflections, aliases: '-i'
    def search(term)
      inflections = options[:inflections].split(',')
      search = Search.new \
        query: term,
        tool: options[:search_tool],
        inflections: inflections

      if search.results.any?
        search.results.each do |inflection, search_result|
          say ">> #{inflection}:"
          say search_result
        end

        replace search, options[:replace_with], inflections if replace?
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
