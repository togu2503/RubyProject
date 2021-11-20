# encoding utf-8
require 'date'
require 'open-uri'
require 'nokogiri'
require 'json'

module ParserToJson

    def ParserToJson.parse_html_by_url(web_site_url)
        # find all jobs on the page
        html = URI.open(web_site_url.to_s)
        html_document = Nokogiri::HTML(html)

        news_items = []
        html_document.css('#content .col-xs-8.col-txt').each do |news_item|
            puts "start"
            puts news_item
            begin
                title = news_item.css('.entry-title.text-uppercase').text.strip
                link = news_item.css('.entry-title.text-uppercase').to_s[/a href="[a-z\-\/:\.0-9]+"/, 0].strip.gsub(/a href=["']+/, '')
                time = news_item.css('time.published').text.strip
                text = news_item.css('.entry-excerpt').text.strip
            rescue NoMethodError => e
                puts e
            end
            
            news_items.push(
              title:title,
              link:link,
              time:time,
              text:text
            )
        end
        news_items
    end

    def ParserToJson.make_pretty_json(jobs_hash)
        JSON.pretty_generate(jobs_hash)
    end

    def ParserToJson.save_to_json(file_path, jobs_hash)
        # save the pretty json with parsed jobs to the file

        pretty_json = ParserToJson.make_pretty_json(jobs_hash)
        File.open(file_path, "w+") do |json_file|
            json_file.write(pretty_json)
         end
    end

end
