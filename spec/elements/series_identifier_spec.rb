# coding: utf-8

require 'spec_helper.rb'

describe ONIX::SeriesIdentifier do

  before(:each) do
    load_doc_and_root("series_identifier.xml")
  end

  it "should correctly convert to a string" do
    series = ONIX::SeriesIdentifier.from_xml(@root.to_s)
    expect(series.to_xml.to_s[0,18]).to eql("<SeriesIdentifier>")
  end

  it "should provide read access to first level attributes" do
    series = ONIX::SeriesIdentifier.from_xml(@root.to_s)

    expect(series.series_id_type).to eql(1)
    expect(series.id_value).to eql("10001")
  end

  it "should provide write access to first level attributes" do
    series = ONIX::SeriesIdentifier.new

    series.series_id_type = 9
    expect(series.to_xml.to_s.include?("<SeriesIDType>09</SeriesIDType>")).to be_truthy

    series.id_value = 999
    expect(series.to_xml.to_s.include?("<IDValue>999</IDValue>")).to be_truthy
  end

end
