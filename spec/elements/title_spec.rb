# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Title do

  before(:each) do
    load_doc_and_root("title.xml")
  end

  it "should correctly convert to a string" do
    t = ONIX::Title.from_xml(@root.to_s)
    expect(t.to_xml.to_s[0,7]).to eql("<Title>")
  end

  it "should provide read access to first level attributes" do
    t = ONIX::Title.from_xml(@root.to_s)
    expect(t.title_type).to eql(1)
    expect(t.title_text).to eql("Good Grief")
    expect(t.subtitle).to   eql("A Constructive Approach to the Problem of Loss")
  end

  it "should provide write access to first level attributes" do
    t = ONIX::Title.new

    t.title_type = 1
    expect(t.to_xml.to_s.include?("<TitleType>01</TitleType>")).to be_truthy

    t.title_text = "Good Grief"
    expect(t.to_xml.to_s.include?("<TitleText>Good Grief</TitleText>")).to be_truthy

    t.subtitle = "Blah"
    expect(t.to_xml.to_s.include?("<Subtitle>Blah</Subtitle>")).to be_truthy

  end

end

