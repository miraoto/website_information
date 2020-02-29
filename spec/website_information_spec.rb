require "spec_helper"

RSpec.describe WebsiteInformation do
  it "has a version number" do
    expect(WebsiteInformation::VERSION).not_to be nil
  end

  let(:params) { WebsiteInformation::Website.new('https://github.com/miraoto/website_information').scraped_params }

  it "Valid initial information for scraping" do
    expect(params.url).to eq('https://github.com/miraoto/website_information')
  end

  it "Valid scraped 'site' params" do
    expect(params.title).to eq('GitHub - miraoto/website_information: scrape website information that title, meta, page capture, description, ogp and so on.')
  end

  it "Valid scraped 'favicon' params" do
    expect(params.favicon).to eq('https://github.githubassets.com/favicon.ico')

    params_for_favicon_path = WebsiteInformation::Website.new('https://rubygems.org').scraped_params
    expect(params_for_favicon_path.favicon).to eq('https://rubygems.org/favicon.ico')

    params_for_no_favicon = WebsiteInformation::Website.new('http://2ch.sc/').scraped_params
    expect(params_for_no_favicon.favicon).to eq('http://2ch.sc/favicon.ico')
  end

  it "Valid scraped 'feed' params" do
    expect(params.feed).to eq('https://github.com/miraoto/website_information/commits/master.atom')
  end

  let(:png_header) { "\211PNG".force_encoding('ASCII-8BIT') }

  it "Valid extract screenshot capture" do
    expect(params.capture).not_to be_nil
    expect(params.capture[0..3]).to eq png_header
  end


  it "Valid scraped 'meta' params" do
    expect(params.meta.description).to eq('scrape website information that title, meta, page capture, description, ogp and so on. - miraoto/website_informationscrape website information that title, meta, page capture, description, ogp and so on. - miraoto/website_information')
  end

  it "Valid scraped 'og' params" do
    expect(params.og.site_name).to eq('GitHub')
    expect(params.og.description).to eq('scrape website information that title, meta, page capture, description, ogp and so on. - miraoto/website_information')
    expect(params.og.title).to eq('miraoto/website_information')
    expect(params.og.url).to eq('https://github.com/miraoto/website_information')
    expect(params.og.image).to eq('https://avatars3.githubusercontent.com/u/1483607?s=400&v=4')
    expect(params.og.type).to eq('object')
  end
end
