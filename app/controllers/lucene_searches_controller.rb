class LuceneSearchesController < ApplicationController
  before_action :set_lucene_search, only: [:show, :update, :destroy]

  # GET /lucene_searches
  # GET /lucene_searches.json
  def index
    @lucene_searches = LuceneSearch.all

    render json: @lucene_searches
  end

  # GET /lucene_searches/1
  # GET /lucene_searches/1.json
  def show
    render json: @lucene_search
  end

  # POST /lucene_searches
  # POST /lucene_searches.json
  def create
    @lucene_search = LuceneSearch.new(lucene_search_params)

    if @lucene_search.save
      render json: @lucene_search, status: :created, location: @lucene_search
    else
      render json: @lucene_search.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lucene_searches/1
  # PATCH/PUT /lucene_searches/1.json
  def update
    @lucene_search = LuceneSearch.find(params[:id])

    if @lucene_search.update(lucene_search_params)
      head :no_content
    else
      render json: @lucene_search.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lucene_searches/1
  # DELETE /lucene_searches/1.json
  def destroy
    @lucene_search.destroy

    head :no_content
  end

  private

    def set_lucene_search
      @lucene_search = LuceneSearch.find(params[:id])
    end

    def lucene_search_params
      params.require(:lucene_search).permit(:query)
    end
end
