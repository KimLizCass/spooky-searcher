class SearchController < ApplicationController
  def query
    puts params[:query]
  end
end
