# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Measure do

  before(:each) do
    load_doc_and_root("measure.xml")
  end

  it "should correctly convert to a string" do
    m = ONIX::Measure.from_xml(@root.to_s)
    expect(m.to_xml.to_s[0,9]).to eql("<Measure>")
  end

  it "should provide read access to first level attributes" do
    m = ONIX::Measure.from_xml(@root.to_s)

    expect(m.measure_type_code).to eql(1)
    expect(m.measurement).to eql(210)
    expect(m.measure_unit_code).to eql("mm")
  end

  it "should provide write access to first level attributes" do
    m = ONIX::Measure.new

    m.measure_type_code = 1
    expect(m.to_xml.to_s.include?("<MeasureTypeCode>01</MeasureTypeCode>")).to be_truthy

    m.measurement = 300
    expect(m.to_xml.to_s.include?("<Measurement>300</Measurement>")).to be_truthy

    m.measure_unit_code = "mm"
    expect(m.to_xml.to_s.include?("<MeasureUnitCode>mm</MeasureUnitCode>")).to be_truthy
  end

end

