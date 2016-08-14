# coding: utf-8

require 'spec_helper.rb'

describe ONIX::ProductIdentifier do

  before(:each) do
    load_doc_and_root("product_identifier.xml")
  end

  it "should correctly convert to a string" do
    id = ONIX::ProductIdentifier.from_xml(@root.to_s)
    expect(id.to_xml.to_s[0,19]).to eql("<ProductIdentifier>")
  end

  it "should provide read access to first level attributes" do
    id = ONIX::ProductIdentifier.from_xml(@root.to_s)

    expect(id.product_id_type).to eql(2)
    expect(id.id_value).to eql("0858198363")
  end

  it "should provide write access to first level attributes" do
    id = ONIX::ProductIdentifier.new

    id.product_id_type = 2
    expect(id.to_xml.to_s.include?("<ProductIDType>02</ProductIDType>")).to be_truthy

    id.id_value = "James"
    expect(id.to_xml.to_s.include?("<IDValue>James</IDValue>")).to be_truthy

  end

end

