require 'rss'
require 'open-uri'
require 'json'

scraped_titles = Array.new


path = 'nosleep.xml'
open(path) do |contents|
  feed = RSS::Parser.parse(contents)
  feed.items.each do |episode|
    data = Hash.new
    data["title"] = episode.title
    scraped_titles.push(data)
  end
end

File.open("titles.json","w") do |f|
  f.write(scraped_titles.to_json)
end