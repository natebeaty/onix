# coding: utf-8

require 'spec_helper.rb'

describe ONIX::ProductClassification do

  before(:each) do
    load_doc_and_root("product_classification.xml")
  end

  it "should correctly convert to a string" do
    a = ONIX::ProductClassification.from_xml(@root.to_s)
    tag = "<ProductClassification>"
    expect(a.to_xml.to_s[0, tag.length]).to eql(tag)
  end

  it "should provide read access to first level attributes" do
    a = ONIX::ProductClassification.from_xml(@root.to_s)
    expect(a.product_classification_type).to eql(2)
    expect(a.product_classification_code).to eql("55101514")
    expect(a.percent).to eql(66.67)
  end

  it "should provide write access to first level attributes" do
    a = ONIX::ProductClassification.new

    a.product_classification_type = 3
    expect(a.to_xml.to_s.include?("<ProductClassificationType>03</ProductClassificationType>")).to be_truthy

    a.product_classification_code = "DATA"
    expect(a.to_xml.to_s.include?("<ProductClassificationCode>DATA</ProductClassificationCode>")).to be_truthy

    a.percent = 50
    expect(a.to_xml.to_s.include?("<Percent>50</Percent>")).to be_truthy
  end

end
