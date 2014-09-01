require 'active_support/all'

require 'fleck/version'
require 'fleck/cli'
require 'fleck/search'

module Fleck
  class << self
    def config
      @config ||= ActiveSupport::OrderedOptions.new
    end

    def version
      Fleck::VERSION
    end
  end
end
