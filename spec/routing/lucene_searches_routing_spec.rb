require "rails_helper"

RSpec.describe LuceneSearchesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lucene_searches").to route_to("lucene_searches#index")
    end

    it "routes to #new" do
      expect(:get => "/lucene_searches/new").to route_to("lucene_searches#new")
    end

    it "routes to #show" do
      expect(:get => "/lucene_searches/1").to route_to("lucene_searches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lucene_searches/1/edit").to route_to("lucene_searches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lucene_searches").to route_to("lucene_searches#create")
    end

    it "routes to #update" do
      expect(:put => "/lucene_searches/1").to route_to("lucene_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lucene_searches/1").to route_to("lucene_searches#destroy", :id => "1")
    end

  end
end
