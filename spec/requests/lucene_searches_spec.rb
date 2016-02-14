require 'rails_helper'

RSpec.describe "LuceneSearches", :type => :request do
  describe "GET /lucene_searches" do
    it "works! (now write some real specs)" do
      get lucene_searches_path
      expect(response.status).to be(200)
    end
  end
end
