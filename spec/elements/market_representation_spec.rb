# coding: utf-8

require 'spec_helper.rb'

describe ONIX::MarketRepresentation do

  before(:each) do
    load_doc_and_root("market_representation.xml")
  end

  it "should correctly convert to a string" do
    rep = ONIX::MarketRepresentation.from_xml(@root.to_s)
    expect(rep.to_xml.to_s[0,22]).to eql("<MarketRepresentation>")
  end

  it "should provide read access to first level attributes" do
    rep = ONIX::MarketRepresentation.from_xml(@root.to_s)

    expect(rep.agent_name).to eql("Allen & Unwin")
    expect(rep.agent_role).to eql(7)
  end

  it "should provide write access to first level attributes" do
    rep = ONIX::MarketRepresentation.new

    rep.agent_name = "Rainbow Book Agencies"
    expect(rep.to_xml.to_s.include?("<AgentName>Rainbow Book Agencies</AgentName>")).to be_truthy

    rep.agent_role = 3
    expect(rep.to_xml.to_s.include?("<AgentRole>03</AgentRole>")).to be_truthy

  end

end
