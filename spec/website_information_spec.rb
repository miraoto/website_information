require "spec_helper"
require 'website_information/website'

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

  it "Valid extract screenshot capture" do
    skip
    expect(params.capture).to eq('')
  end


  it "Valid scraped 'meta' params" do
    skip
    expect(params.meta.description).to eq('website_information - scrape website information that title, meta, page capture, description, ogp and so on.')
  end

  it "Valid scraped 'og' params" do
    skip
    expect(params.og.site_name).to eq('GitHub')
    expect(params.og.description).to eq('website_information - scrape website information that title, meta, page capture, description, ogp and so on.')
    expect(params.og.title).to eq('miraoto/website_information')
    expect(params.og.url).to eq('https://github.com/miraoto/website_information')
    expect(params.og.image).to eq('https://avatars3.githubusercontent.com/u/1483607?v=4&s=400')
    expect(params.og.type).to eq('object')
  end
end
