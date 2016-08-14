# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Series do

  before(:each) do
    load_doc_and_root("series.xml")
  end

  it "should correctly convert to a string" do
    series = ONIX::Series.from_xml(@root.to_s)
    expect(series.to_xml.to_s[0,8]).to eql("<Series>")
  end

  it "should provide read access to first level attributes" do
    series = ONIX::Series.from_xml(@root.to_s)

    expect(series.title_of_series).to eql("Citizens and Their Governments")
  end

  it "should provide write access to first level attributes" do
    series = ONIX::Series.new

    series.title_of_series = "Cool Science Careers"
    expect(series.to_xml.to_s.include?("<TitleOfSeries>Cool Science Careers</TitleOfSeries>")).to be_truthy
  end

end
