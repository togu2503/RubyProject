# encoding utf-8

class CarsLists

    def initialize(browser_agent)
        @browser_agent = browser_agent
    end

    def goto_civics()
        @browser_agent.open_url('https://auto.ria.com/uk/legkovie/honda/civic/')

    end

end
