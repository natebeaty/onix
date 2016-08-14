# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Language do

  before(:each) do
    load_doc_and_root("language.xml")
  end

  it "should correctly convert to a string" do
    lan = ONIX::Language.from_xml(@root.to_s)
    expect(lan.to_xml.to_s[0,10]).to eql("<Language>")
  end

  it "should provide read access to first level attributes" do
    lan = ONIX::Language.from_xml(@root.to_s)

    expect(lan.language_role).to eql(1)
    expect(lan.language_code).to eql("eng")
    expect(lan.country_code).to eql("US")
  end

  it "should provide write access to first level attributes" do
    lan = ONIX::Language.new

    lan.language_role = 2
    expect(lan.to_xml.to_s.include?("<LanguageRole>02</LanguageRole>")).to be_truthy

    lan.language_code = "aar"
    expect(lan.to_xml.to_s.include?("<LanguageCode>aar</LanguageCode>")).to be_truthy

    lan.country_code = "AD"
    expect(lan.to_xml.to_s.include?("<CountryCode>AD</CountryCode>")).to be_truthy
  end

end
