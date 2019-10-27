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
    data["description"] = episode.description.strip.slice(0..45)
    scraped_titles.push(data)
  end
end

File.open("episodes.json","w") do |f|
  pretty = JSON.pretty_generate(scraped_titles)
  f.write(pretty)
end

