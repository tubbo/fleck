require 'spec_helper'
require 'fleck/search'

module Fleck
  RSpec.describe Search do
    subject do
      Search.new query: 'ContentFile', tool: 'grep'
    end

    it "has a query" do
      expect(subject.query).to eq('ContentFile')
    end

    it "has a tool" do
      expect(subject.tool).to eq('grep')
    end

    context "with inflections" do
      before do
        allow(subject).to receive(:search_on).with('ContentFile').and_return \
          ['content_file.rb: class ContentFile']
        allow(subject).to receive(:search_on).with('content_files').and_return \
          ['series.rb:   has_many :content_files']

        subject.inflections = [:tableize]
      end

      it "applies all inflections to the query" do
        expect(subject.inflected_queries).to include('ContentFile')
        expect(subject.inflected_queries).to include('content_files')
      end

      it "contains a list of inflections to use on the query" do
        expect(subject.inflections).to include(:tableize)
      end

      it "searches on all inflected queries" do
        expect(subject.results.keys).to include('ContentFile')
        expect(subject.results.keys).to include('content_files')
      end

      it "includes search results for the original query" do
        expect(subject.results['ContentFile']).to_not be_empty
        expect(subject.results['ContentFile']).to \
          include('content_file.rb: class ContentFile')
      end

      it "includes search results for the inflected query" do
        expect(subject.results['content_files']).to_not be_empty
        expect(subject.results['content_files']).to \
          include('series.rb:   has_many :content_files')
      end
    end

    context "without inflections" do
      before { subject.inflections = nil }

      it "returns search results for the query" do
        allow(subject).to receive(:search_on).with('ContentFile').and_return \
          ['content_file.rb: class ContentFile']

        expect(subject.results).to_not be_nil
        expect(subject.results).to_not be_empty
        expect(subject.results.keys).to include('ContentFile')
        expect(subject.results['ContentFile']).to include('content_file.rb: class ContentFile')
      end
    end
  end
end
