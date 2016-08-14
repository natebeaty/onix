# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Subject do

  before(:each) do
    load_doc_and_root("subject.xml")
  end

  it "should correctly convert to a string" do
    sub = ONIX::Subject.from_xml(@root.to_s)
    expect(sub.to_xml.to_s[0,9]).to eql("<Subject>")
  end

  it "should provide read access to first level attributes" do
    sub = ONIX::Subject.from_xml(@root.to_s)
    expect(sub.subject_scheme_id).to eql(3)
    expect(sub.subject_scheme_name).to eql("RBA Subjects")
    expect(sub.subject_code).to eql("AABB")
  end

  it "should provide write access to first level attributes" do
    sub = ONIX::Subject.new

    sub.subject_scheme_id = 2
    expect(sub.to_xml.to_s.include?("<SubjectSchemeIdentifier>02</SubjectSchemeIdentifier>")).to be_truthy

    sub.subject_code = "ABCD"
    expect(sub.to_xml.to_s.include?("<SubjectCode>ABCD</SubjectCode>")).to be_truthy

  end

end
