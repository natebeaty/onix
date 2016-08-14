# coding: utf-8

require 'spec_helper.rb'

describe ONIX::ContainedItem do

  before(:each) do
    load_doc_and_root("contained_item.xml")
  end

  it "should correctly convert to a string" do
    item = ONIX::ContainedItem.from_xml(@root.to_s)
    expect(item.to_xml.to_s[0,15]).to eql("<ContainedItem>")
  end

  it "should provide read access to first level attributes" do
    item = ONIX::ContainedItem.from_xml(@root.to_s)
    expect(item.product_form).to eql("BB")
    expect(item.product_form_details).to eql(["B206"])
    expect(item.item_quantity).to eql(1)
  end

  it "should provide write access to first level attributes" do
    item = ONIX::ContainedItem.new
    item.product_content_type = 1
    expect(item.to_xml.to_s.include?("<ProductContentType>01</ProductContentType>")).to be_truthy
  end

  it "should provide read access to product identifiers" do
    item = ONIX::ContainedItem.from_xml(@root.to_s)
    expect(item.product_identifiers.first.id_value).to eql("9999")
    expect(item.product_identifiers.last.id_value).to eql("9780194351898")
  end

  it "should provide write access to product identifiers" do
    item = ONIX::ContainedItem.new
    pid = ONIX::ProductIdentifier.new
    expect { item.product_identifiers << pid }.to change(item.product_identifiers, :size).by(1)
  end

end
