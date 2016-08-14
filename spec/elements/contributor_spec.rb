# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Contributor do

  before(:each) do
    load_doc_and_root("contributor.xml")
  end

  it "should correctly convert to a string" do
    header = ONIX::Contributor.from_xml(@root.to_s)
    expect(header.to_xml.to_s[0,13]).to eql("<Contributor>")
  end

  it "should provide read access to first level attributes" do
    contrib = ONIX::Contributor.from_xml(@root.to_s)

    expect(contrib.contributor_role).to eql("A01")
    expect(contrib.person_name_inverted).to eql("SHAPIRO")
    expect(contrib.sequence_number).to eql(1)
  end

  it "should provide write access to first level attributes" do
    contrib = ONIX::Contributor.new

    contrib.contributor_role = "A02"
    expect(contrib.to_xml.to_s.include?("<ContributorRole>A02</ContributorRole>")).to be_truthy

    contrib.person_name_inverted = "Healy, James"
    expect(contrib.to_xml.to_s.include?("<PersonNameInverted>Healy, James</PersonNameInverted>")).to be_truthy

    contrib.sequence_number = 1
    expect(contrib.to_xml.to_s.include?("<SequenceNumber>1</SequenceNumber>")).to be_truthy
  end

end
