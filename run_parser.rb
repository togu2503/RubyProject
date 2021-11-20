# encoding utf-8

=begin
This programm parses a web page and saves it to json and csv
=end
require_relative "helpers/csv_manager.rb"
require_relative "helpers/parser_to_json.rb"
require_relative "helpers/browser_agent.rb"
require_relative "web_pages/cars_list.rb"


def main()
    json_file_path = './cars.json'
    csv_file_path = './cars.csv'
    agent = BrowserAgent.new
    cars_list = CarsLists.new(agent)
    cars_list.goto_civics
    cars = ParserToJson.parse_html_by_url(agent.get_current_page_uri)
    # save to json
    ParserToJson.save_to_json(json_file_path, cars)
    # save to csv
    CSVManager.save_to_csv(csv_file_path, cars)
end


main()

