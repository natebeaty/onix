# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Audience do

  before(:each) do
    load_doc_and_root("audience.xml")
  end

  it "should correctly convert to a string" do
    a = ONIX::Audience.from_xml(@root.to_s)
    expect(a.to_xml.to_s[0,10]).to eql("<Audience>")
  end

  it "should provide read access to first level attributes" do
    a = ONIX::Audience.from_xml(@root.to_s)
    expect(a.audience_code_type).to eql(2)
    expect(a.audience_code_type_name).to eql("Guided Reading Level")
    expect(a.audience_code_value).to eql("G")
  end

  it "should provide write access to first level attributes" do
    a = ONIX::Audience.new

    a.audience_code_type = 19
    expect(a.to_xml.to_s.include?("<AudienceCodeType>19</AudienceCodeType>")).to be_truthy

    a.audience_code_value = "480"
    expect(a.to_xml.to_s.include?("<AudienceCodeValue>480</AudienceCodeValue>")).to be_truthy
  end

end
