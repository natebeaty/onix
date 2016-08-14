# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Publisher do

  before(:each) do
    load_doc_and_root("publisher.xml")
  end

  it "should correctly convert to a string" do
    pub = ONIX::Publisher.from_xml(@root.to_s)
    expect(pub.to_xml.to_s[0,11]).to eql("<Publisher>")
  end

  it "should provide read access to first level attributes" do
    pub = ONIX::Publisher.from_xml(@root.to_s)
    expect(pub.publishing_role).to eql(1)
    expect(pub.publisher_name).to eql("Desbooks Publishing")
  end

  it "should provide write access to first level attributes" do
    pub = ONIX::Publisher.new

    pub.publisher_name = "Paulist Press"
    expect(pub.to_xml.to_s.include?("<PublisherName>Paulist Press</PublisherName>")).to be_truthy

    pub.publishing_role = 2
    expect(pub.to_xml.to_s.include?("<PublishingRole>02</PublishingRole>")).to be_truthy
  end

end

