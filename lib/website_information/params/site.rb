module WebsiteInformation
  module Params
    class Site
      attr_accessor :url, :title

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
        "http://capture.heartrails.com/160x128/shoten?#{@url}"
      end
    end
  end
end
