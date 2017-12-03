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
          options = Selenium::WebDriver::Chrome::Options.new(binary: binary, args: %w{headless no-sandbox disable-gpu window-size=1280,600 hide-scrollbars})
          browser = Selenium::WebDriver.for :chrome, options: options
          begin
            browser.get @url
            @capture = browser.screenshot_as(:png)
          rescue
            @capture = nil
          ensure
            browser.close
          end
        end
        @capture
      end
    end
  end
end
