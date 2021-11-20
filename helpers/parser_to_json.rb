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
        cars_items = []
        html_document.css('.ticket-item').each do |car_item|
            begin
            	title = car_item.css('.address').text
            	link = car_item.css('.address')[0]['href']
            	price = car_item.css('.price-ticket')[0]['data-main-price']
       	currency = car_item.css('.price-ticket')[0]['data-main-currency']
       	kilometrage = car_item.css('.js-race').text
       	
            rescue NoMethodError => e
                puts e
            end
            
      	     cars_items.push(
            title:title,
            price:price,
            currency:currency,
            kilometrage:kilometrage,
            link:link)
            
        end
        cars_items
    end

    def ParserToJson.make_pretty_json(cars_hash)
        JSON.pretty_generate(cars_hash)
    end

    def ParserToJson.save_to_json(file_path, jobs_hash)
        # save the pretty json with parsed jobs to the file

        pretty_json = ParserToJson.make_pretty_json(jobs_hash)
        File.open(file_path, "w+") do |json_file|
            json_file.write(pretty_json)
         end
    end

end
