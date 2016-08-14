# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Website do

  before(:each) do
    load_doc_and_root("website.xml")
  end

  it "should correctly convert to a string" do
    web = ONIX::Website.from_xml(@root.to_s)
    expect(web.to_xml.to_s[0,9]).to eql("<Website>")
  end

  it "should provide read access to first level attributes" do
    web = ONIX::Website.from_xml(@root.to_s)

    expect(web.website_role).to eql(1)
    expect(web.website_link).to eql("http://www.rainbowbooks.com.au")
  end

  it "should provide write access to first level attributes" do
    web = ONIX::Website.new

    web.website_role = 2
    expect(web.to_xml.to_s.include?("<WebsiteRole>02</WebsiteRole>")).to be_truthy

    web.website_link = "http://www.yob.id.au"
    expect(web.to_xml.to_s.include?("<WebsiteLink>http://www.yob.id.au</WebsiteLink>")).to be_truthy

  end

end


