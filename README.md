# WebsiteInformation

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

## Usage

```
scraped_params = WebsiteInformation::Website.new('scraping_url(ex. https://www.google.com)').scraped_params

# ex) get website title
scraped_params.title
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/website_information. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WebsiteInformation project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/website_information/blob/master/CODE_OF_CONDUCT.md).
