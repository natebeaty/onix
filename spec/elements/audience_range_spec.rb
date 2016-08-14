# coding: utf-8

require 'spec_helper.rb'

describe ONIX::AudienceRange do

  before(:each) do
    load_doc_and_root("audience_range.xml")
  end

  it "should correctly convert to a string" do
    aud = ONIX::AudienceRange.from_xml(@root.to_s)
    expect(aud.to_xml.to_s[0,15]).to eql("<AudienceRange>")
  end

  it "should provide read access to first level attributes" do
    aud = ONIX::AudienceRange.from_xml(@root.to_s)

    expect(aud.audience_range_qualifier).to eql(11)
    expect(aud.audience_range_precisions.size).to eql(2)
    expect(aud.audience_range_precisions[0]).to eql(3)
    expect(aud.audience_range_precisions[1]).to eql(4)
    expect(aud.audience_range_values.size).to eql(2)
    expect(aud.audience_range_values[0]).to eql('K')
    expect(aud.audience_range_values[1]).to eql('5')
  end

  it "should provide write audience range as exact value" do
    aud = ONIX::AudienceRange.new
    aud.audience_range_qualifier = 12  # UK school grade
    aud.audience_range_precisions = [1]  # Exact
    aud.audience_range_values = [999]
    expect(aud.to_xml.to_s).to eql("<AudienceRange>\n  <AudienceRangeQualifier>12</AudienceRangeQualifier>\n  <AudienceRangePrecision>01</AudienceRangePrecision>\n  <AudienceRangeValue>999</AudienceRangeValue>\n</AudienceRange>")
  end

  it "should write audience range as bounded" do
    aud = ONIX::AudienceRange.new
    aud.audience_range_qualifier = 18  # Reading age, years
    aud.audience_range_precisions = [3,4]  # From, To
    aud.audience_range_values = [9,12]
    expect(aud.to_xml.to_s).to eql("<AudienceRange>\n  <AudienceRangeQualifier>18</AudienceRangeQualifier>\n  <AudienceRangePrecision>03</AudienceRangePrecision>\n  <AudienceRangeValue>9</AudienceRangeValue>\n  <AudienceRangePrecision>04</AudienceRangePrecision>\n  <AudienceRangeValue>12</AudienceRangeValue>\n</AudienceRange>")
  end

end
