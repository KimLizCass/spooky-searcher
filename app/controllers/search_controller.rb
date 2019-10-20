$all_episodes = JSON.parse(File.read('episodes.json'))
class SearchController < ApplicationController
  def query
    puts params[:query]
    @episodes = $all_episodes.select { |episode|
      contains_title = episode["title"].downcase.include? params[:query].downcase
      contains_author = episode["author"].downcase.include? params[:query].downcase
      contains_title || contains_author
    }
  end
end
