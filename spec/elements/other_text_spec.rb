# coding: utf-8

require 'spec_helper.rb'

describe ONIX::OtherText do

  before(:each) do
    load_doc_and_root("other_text.xml")
  end

  it "should correctly convert to a string" do
    ot = ONIX::OtherText.from_xml(@root.to_s)
    expect(ot.to_xml.to_s[0,11]).to eql("<OtherText>")
  end

  it "should provide read access to first level attributes" do
    ot = ONIX::OtherText.from_xml(@root.to_s)

    expect(ot.text_type_code).to eql(2)
    expect(ot.text[0,7]).to eql("A woman")
  end

  it "should provide write access to first level attributes" do
    ot = ONIX::OtherText.new

    ot.text_type_code = 2
    expect(ot.to_xml.to_s.include?("<TextTypeCode>02</TextTypeCode>")).to be_truthy

    ot.text = "James Healy"
    expect(ot.to_xml.to_s.include?("<Text>James Healy</Text>")).to be_truthy

  end

end

