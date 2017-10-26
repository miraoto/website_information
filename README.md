# WebsiteInformation

[![Gem Version](https://badge.fury.io/rb/website_information.svg)](https://badge.fury.io/rb/website_information) [![Code Climate](https://codeclimate.com/github/miraoto/website_information/badges/gpa.svg)](https://codeclimate.com/github/miraoto/website_information) [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE) [![Build Status](https://travis-ci.org/miraoto/website_information.svg?branch=master)](https://travis-ci.org/miraoto/website_information)

Scrape website information that title, meta, page capture, description, ogp and so on.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'website_information'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install website_information

### for site capture setting
Please install [chromedriver](https://chromedriver.storage.googleapis.com/)(webdriver) if you want to use site capture.

Install chromedriver. https://chromedriver.storage.googleapis.com/  or ``` brew install chromedriver ```

#### Capture in heroku

If you use this gem in heroku, please install relational buildpacks (https://github.com/heroku/heroku-buildpack-chromedriver.git, https://github.com/heroku/heroku-buildpack-google-chrome.git) and your language's fontconfig to ``` ./fonts ``` 

## Usage

```
scraped_params = WebsiteInformation::Website.new('scraping_url(ex. https://www.google.com)').scraped_params

# ex) get website title
scraped_params.title # => Google

```

### Output
The list of allowed get `params` values.

 * ```.title```  — ```<title>``` tag value
 * ```.meta.description```  — ```<meta name="description"　>``` tag content
 * ```.meta.keyword```  — ```<meta name="keyword"　>``` tag content
 * ```.og.site_name```  — ```<meta property="og:site_name"　>``` tag content
 * ```.og.description```  — ```<meta property="og:description"　>``` tag content
 * ```.og.url```  — ```<meta property="og:url"　>``` tag content
 * ```.og.type```  — ```<meta property="og:type"　>``` tag content
 * ```.og.image```  — ```<meta property="og:image"　>``` tag content
 * ```.feed```  — ```<link rel="alternate"　>``` tag href application/atom+xml or application/rss+xml type
 * ```.sns.facebook```  — Facebook page plugin (https://developers.facebook.com/docs/plugins/page-plugin/) from data-href
 * ```.sns.twitter```  — Twitter embedded timelines (https://dev.twitter.com/web/embedded-timelines/list) from href


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/miraoto/website_information. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WebsiteInformation project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/website_information/blob/master/CODE_OF_CONDUCT.md).
