require 'nokogiri'
require 'watir'

module WebsiteInformation
  class Website
    def initialize(url)
      @params = WebsiteInformation::Params::Site.new(url)
      scrape(url)
      capture(url)
    end

    def scraped_params
      @params
    end

    private

    def scrape(url)
      doc = ::Nokogiri::HTML(open(url))
      @params.title = doc.title
      @params.meta.description = doc.css('//meta[name$="description"]/@content').first.value
      @params.meta.keyword = doc.css('//meta[name$="keyword"]/@content')
      @params.og.site_name = doc.css('//meta[property$="og:site_name"]/@content').to_s
      @params.og.description = doc.css('//meta[property="og:description"]/@content').to_s
      @params.og.title = doc.css('//meta[property="og:title"]/@content').to_s
      @params.og.url = doc.css('//meta[property="og:url"]/@content').to_s
      @params.og.type = doc.css('//meta[property="og:type"]/@content').to_s
      @params.og.image = doc.css('//meta[property="og:image"]/@content').to_s
    end

    def capture(url)
      browser = Watir::Browser.new
      browser.goto url
      @params.capture = browser.screenshot.png
      browser.close
    end
  end
end
