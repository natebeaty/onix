# coding: utf-8

require 'spec_helper.rb'

describe ONIX::WorkIdentifier do

  before(:each) do
    load_doc_and_root("work_identifier.xml")
  end

  it "should correctly convert to a string" do
    t = ONIX::WorkIdentifier.from_xml(@root.to_s)
    expect(t.to_xml.to_s[0,16]).to eql("<WorkIdentifier>")
  end

  it "should provide read access to first level attributes" do
    t = ONIX::WorkIdentifier.from_xml(@root.to_s)
    expect(t.work_id_type).to eql(1)
    expect(t.id_type_name).to eql("Proprietary Publisher Scheme")
    expect(t.id_value).to eql("ABC123")
  end

  it "should provide write access to first level attributes" do
    t = ONIX::WorkIdentifier.new

    t.work_id_type = 1
    expect(t.to_xml.to_s.include?("<WorkIDType>01</WorkIDType>")).to be_truthy

    t.id_type_name = "Proprietary Publisher Scheme"
    expect(t.to_xml.to_s.include?("<IDTypeName>Proprietary Publisher Scheme</IDTypeName>")).to be_truthy

    t.id_value = "ABC123"
    expect(t.to_xml.to_s.include?("<IDValue>ABC123</IDValue>")).to be_truthy
  end

  it "should properly initialize attributes when calling new" do
    t = ONIX::WorkIdentifier.new(:work_id_type => 1, :id_value => "value", :id_type_name => "name")
    expect(t.work_id_type).to eql(1)
    expect(t.id_value).to eql("value")
    expect(t.id_type_name).to eql("name")
  end

end
