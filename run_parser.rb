# encoding utf-8

=begin
This programm parses a web page and saves it to json and csv
=end
require_relative "helpers/csv_manager.rb"
require_relative "helpers/parser_to_json.rb"


def main()
    json_file_path = './cars.json'
    csv_file_path = './cars.csv'
    cars = ParserToJson.parse_html_by_url('https://auto.ria.com/uk/legkovie/honda/civic/')
    # save to json
    ParserToJson.save_to_json(json_file_path, cars)
    # save to csv
    CSVManager.save_to_csv(csv_file_path, cars)
end


main()

