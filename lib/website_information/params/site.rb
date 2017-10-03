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
          # TODO if 'https://github.com/SeleniumHQ/selenium/issues/4591' pull-request merged, commit this code.
          options = Selenium::WebDriver::Firefox::Options.new
          options.headless!
          browser = Selenium::WebDriver.for :firefox, options: options
          browser.get @url
          @capture = browser.screenshot_as(:png)
          # browser = Watir::Browser.new :chrome
          # browser.goto @url
          # @capture = browser.screenshot.png
          browser.close
        end
        @capture
      end
    end
  end
end
