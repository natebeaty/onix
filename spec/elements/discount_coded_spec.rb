# coding: utf-8

require 'spec_helper.rb'

describe ONIX::DiscountCoded do

  before(:each) do
    load_doc_and_root("discount_coded.xml")
  end

  it "should correctly convert to a string" do
    t = ONIX::DiscountCoded.from_xml(@root.to_s)
    expect(t.to_xml.to_s[0,15]).to eql("<DiscountCoded>")
  end

  it "should provide read access to first level attributes" do
    t = ONIX::DiscountCoded.from_xml(@root.to_s)
    expect(t.discount_code_type).to eql(2)
    expect(t.discount_code_type_name).to eql("Proprietary Scheme")
    expect(t.discount_code).to eql("ABC123")
  end

  it "should provide write access to first level attributes" do
    t = ONIX::DiscountCoded.new

    t.discount_code_type = 1
    expect(t.to_xml.to_s.include?("<DiscountCodeType>01</DiscountCodeType>")).to be_truthy

    t.discount_code_type_name = "BIC Scheme"
    expect(t.to_xml.to_s.include?("<DiscountCodeTypeName>BIC Scheme</DiscountCodeTypeName>")).to be_truthy

    t.discount_code = "ABC123"
    expect(t.to_xml.to_s.include?("<DiscountCode>ABC123</DiscountCode>")).to be_truthy
  end

end
