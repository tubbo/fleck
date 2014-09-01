require 'spec_helper'
require 'fleck'

RSpec.describe Fleck do
  it "is a module" do
    expect(Fleck).to be_a(Module)
  end

  it "contains the config" do
    expect(Fleck.config).to be_a(ActiveSupport::OrderedOptions)
  end
end
