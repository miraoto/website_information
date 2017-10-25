require 'selenium-webdriver'

module WebsiteInformation
  module Params
    class Site
      attr_accessor :url, :title, :capture, :feed

      def initialize(url)
        @url = url
        @meta = WebsiteInformation::Params::Meta.new
        @og = WebsiteInformation::Params::Og.new
        @sns = WebsiteInformation::Params::Sns.new
      end

      def meta
        @meta
      end

      def og
        @og
      end

      def sns
        @sns
      end

      def capture
        if @capture.nil?
          binary = ENV.fetch('GOOGLE_CHROME_BIN', nil) # for heroku
          options = Selenium::WebDriver::Chrome::Options.new(binary: binary)
          options.add_argument('--headless')
          browser = Selenium::WebDriver.for :chrome, options: options
          browser.get @url
          @capture = browser.screenshot_as(:png)
          browser.close
        end
        @capture
      end
    end
  end
end
