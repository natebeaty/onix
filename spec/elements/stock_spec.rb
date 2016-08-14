# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Stock do

  before(:each) do
    load_doc_and_root("stock.xml")
  end

  it "should correctly convert to a string" do
    s = ONIX::Stock.from_xml(@root.to_s)
    expect(s.to_xml.to_s[0,7]).to eql("<Stock>")
  end

  it "should provide read access to first level attributes" do
    s = ONIX::Stock.from_xml(@root.to_s)

    # note that these fields *should* be numeric according to the ONIX spec,
    # however heaps of ONIX files in the wild have strings there.
    expect(s.on_hand).to eql("2862")
    expect(s.on_order).to eql("0")
  end

  it "should provide write access to first level attributes" do
    s = ONIX::Stock.new

    s.on_hand = "123"
    expect(s.to_xml.to_s.include?("<OnHand>123</OnHand>")).to be_truthy

    s.on_order = "011"
    expect(s.to_xml.to_s.include?("<OnOrder>011</OnOrder>")).to be_truthy

    s.on_order = 11
    expect(s.to_xml.to_s.include?("<OnOrder>11</OnOrder>")).to be_truthy
  end

end

