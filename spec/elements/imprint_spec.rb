# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Imprint do

  before(:each) do
    load_doc_and_root("imprint.xml")
  end

  it "should correctly convert to a string" do
    imp = ONIX::Imprint.from_xml(@root.to_s)
    expect(imp.to_xml.to_s[0,9]).to eql("<Imprint>")
  end

  it "should provide read access to first level attributes" do
    imp = ONIX::Imprint.from_xml(@root.to_s)

    expect(imp.imprint_name).to eql("Oxford University Press UK")
  end

  it "should provide write access to first level attributes" do
    imp = ONIX::Imprint.new

    imp.imprint_name = "Paulist Press"
    expect(imp.to_xml.to_s.include?("<ImprintName>Paulist Press</ImprintName>")).to be_truthy

    imp.name_code_type = 1
    expect(imp.to_xml.to_s.include?("<NameCodeType>01</NameCodeType>")).to be_truthy

  end

end

