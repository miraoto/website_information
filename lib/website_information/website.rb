require 'nokogiri'

module WebsiteInformation
  class Website
    def initialize(url)
      @params = WebsiteInformation::Params::Site.new(url)
      scrape(url)
    end

    def scraped_params
      @params
    end

    private

    def scrape(url)
      doc = ::Nokogiri::HTML(open(url))
      @params.title = doc.title
      @params.meta.description = doc.css('//meta[name$="description"]/@content').first.try(:value)
      @params.meta.keyword = doc.css('//meta[name$="keyword"]/@content')
      @params.og.site_name = doc.css('//meta[property$="og:site_name"]/@content').to_s
      @params.og.description = doc.css('//meta[property="og:description"]/@content').to_s
      @params.og.title = doc.css('//meta[property="og:title"]/@content').to_s
      @params.og.url = doc.css('//meta[property="og:url"]/@content').to_s
      @params.og.type = doc.css('//meta[property="og:type"]/@content').to_s
      @params.og.image = doc.css('//meta[property="og:image"]/@content').to_s
      feed(doc)
      sns(doc)
    end

    def feed(doc)
      @params.feed = doc.css('//link[@rel="alternate"][@type="application/atom+xml"]/@href')[0].to_s
      @params.feed = doc.css('//link[@rel="alternate"][@type="application/rss+xml"]/@href')[0].to_s if @params.feed.empty?
    end

    def sns(doc)
      # scrape facebook url from page plugin (https://developers.facebook.com/docs/plugins/page-plugin/)
      @params.sns.facebook = doc.css('//div[class$="fb-page"]/@data-href')[0].to_s
      # scrape twitter url from embedded timelines (https://dev.twitter.com/web/embedded-timelines/list)
      @params.sns.twitter = doc.css('//a[class$="twitter-timeline"]/@href')[0].to_s
    end
  end
end
