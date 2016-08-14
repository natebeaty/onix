# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Set do

  before(:each) do
    load_doc_and_root("set.xml")
  end

  it "should correctly convert to a string" do
    set = ONIX::Set.from_xml(@root.to_s)
    expect(set.to_xml.to_s[0,5]).to eql("<Set>")
  end

  it "should provide read access to first level attributes" do
    set = ONIX::Set.from_xml(@root.to_s)
    expect(set.title_of_set).to eql("THE SET NAME")
  end

  it "should provide write access to first level attributes" do
    set = ONIX::Set.new
    set.title_of_set = "TESTING"
    expect(set.to_xml.to_s.include?("<TitleOfSet>TESTING</TitleOfSet>")).to be_truthy
  end

  it "should provide read access to product identifiers" do
    set = ONIX::Set.from_xml(@root.to_s)
    expect(set.product_identifiers.first.id_value).to eql("9999")
    expect(set.product_identifiers.last.id_value).to eql("9780194351898")
  end

  it "should provide write access to product identifiers" do
    set = ONIX::Set.new
    pid = ONIX::ProductIdentifier.new
    expect { set.product_identifiers << pid }.to change(set.product_identifiers, :size).by(1)
  end

end
