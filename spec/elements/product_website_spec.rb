# coding: utf-8

require 'spec_helper.rb'

describe ONIX::ProductWebsite do

  before(:each) do
    load_doc_and_root("product_website.xml")
  end

  it "should correctly convert to a string" do
    web = ONIX::ProductWebsite.from_xml(@root.to_s)
    expect(web.to_xml.to_s[0,16]).to eql("<ProductWebsite>")
  end

  it "should provide read access to first level attributes" do
    web = ONIX::ProductWebsite.from_xml(@root.to_s)
    expect(web.website_role).to eql(1)
    expect(web.product_website_description).to eql("The Child's World: Publishing books for schools and libraries since 1968")
    expect(web.product_website_link).to eql("http://childsworld.com")
  end

  it "should provide write access to first level attributes" do
    web = ONIX::ProductWebsite.new

    web.website_role = 2
    expect(web.to_xml.to_s.include?("<WebsiteRole>02</WebsiteRole>")).to be_truthy

    web.product_website_link = "PUBLISHER WEBSITE"
    expect(web.to_xml.to_s.include?("<ProductWebsiteLink>PUBLISHER WEBSITE</ProductWebsiteLink>")).to be_truthy

    web.product_website_link = "http://www.randomhouse.com"
    expect(web.to_xml.to_s.include?("<ProductWebsiteLink>http://www.randomhouse.com</ProductWebsiteLink>")).to be_truthy
  end

end

