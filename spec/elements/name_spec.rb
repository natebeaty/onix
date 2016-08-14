# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Name do

  before(:each) do
    load_doc_and_root("name.xml")
  end

  it "should correctly convert to a string" do
    name = ONIX::Name.from_xml(@root.to_s)
    expect(name.to_xml.to_s[0,6]).to eql("<Name>")
  end

  it "should provide read access to first level attributes" do
    name = ONIX::Name.from_xml(@root.to_s)
    expect(name.person_name_type).to eql(1)
    expect(name.person_name).to eql("Mark Twain")
  end

  it "should provide write access to first level attributes" do
    name = ONIX::Name.new
    name.person_name_type = 4
    expect(name.to_xml.to_s.include?("<PersonNameType>04</PersonNameType>")).to be_truthy
    name.person_name = "Samuel Clemens"
    expect(name.to_xml.to_s.include?("<PersonName>Samuel Clemens</PersonName>")).to be_truthy
  end

end


