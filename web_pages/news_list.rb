# encoding utf-8

class NewsLists

    def initialize(browser_agent)
        @browser_agent = browser_agent
    end

    def goto_vacancies()
        @browser_agent.open_url('https://itc.ua/news/')
        puts "After go to vacancies the latest opened page is #{@browser_agent.get_latest_opened_page().uri}"

    end

end