module WebsiteInformation
  module Params
    class Site
      attr_accessor :url, :title, :capture

      def initialize(url)
        @url = url
        @meta = WebsiteInformation::Params::Meta.new
        @og = WebsiteInformation::Params::Og.new
      end

      def meta
        @meta
      end

      def og
        @og
      end

      def capture
        if @capture.nil?
          browser = Watir::Browser.new
          browser.goto @url
          @capture = browser.screenshot.png
          browser.close
        end
        @capture
      end
    end
  end
end
