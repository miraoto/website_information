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
        return if ENV['CAPTURE_URL'].nil?
        "#{ENV['CAPTURE_URL']}#{@url}"
      end
    end
  end
end
