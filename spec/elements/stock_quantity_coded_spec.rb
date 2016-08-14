# coding: utf-8

require 'spec_helper.rb'

describe ONIX::StockQuantityCoded do

  before(:each) do
    load_doc_and_root("stock_quantity_coded.xml")
  end

  it "should correctly convert to a string" do
    x = ONIX::StockQuantityCoded.from_xml(@root.to_s)
    tag = "<StockQuantityCoded>"
    expect(x.to_xml.to_s[0, tag.length]).to eql(tag)
  end

  it "should provide read access to first level attributes" do
    x = ONIX::StockQuantityCoded.from_xml(@root.to_s)
    expect(x.stock_quantity_code_type).to eql(1)
    expect(x.stock_quantity_code_type_name).to eql("Ingram")
    expect(x.stock_quantity_code).to eql("LOW")
  end

  it "should provide write access to first level attributes" do
    x = ONIX::StockQuantityCoded.new

    x.stock_quantity_code_type = 2
    expect(x.to_xml.to_s.include?("<StockQuantityCodeType>02</StockQuantityCodeType>")).to be_truthy

    x.stock_quantity_code_type_name = "Follett"
    expect(x.to_xml.to_s.include?("<StockQuantityCodeTypeName>Follett</StockQuantityCodeTypeName>")).to be_truthy

    x.stock_quantity_code = "OUT"
    expect(x.to_xml.to_s.include?("<StockQuantityCode>OUT</StockQuantityCode>")).to be_truthy
  end

end
