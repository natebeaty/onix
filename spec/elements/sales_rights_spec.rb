# coding: utf-8

require 'spec_helper.rb'

describe ONIX::SalesRights do

  before(:each) do
    load_doc_and_root("sales_rights.xml")
    @first_right = @root.at_css("SalesRights")
  end


  it "should correctly convert to a string" do
    rep = ONIX::SalesRights.from_xml(@first_right.to_s)
    expect(rep).to produce_the_tag("<SalesRights>")
  end


  it "should provide read access to first level attributes" do
    p = ONIX::Product.from_xml(@root.to_s)
    expect(p.sales_rights[0].sales_rights_type).to eql(1)
    expect(p.sales_rights[1].rights_countries).to eql(["AU", "NZ"])
  end


  it "should provide write access to first level attributes" do
    sr = ONIX::SalesRights.new
    sr.sales_rights_type = 2
    expect(sr).to include_the_xml("<SalesRightsType>02</SalesRightsType>")
    sr.rights_countries = ["AU", "NZ"]
    expect(sr).to include_the_xml("<RightsCountry>AU</RightsCountry>")
    expect(sr).to include_the_xml("<RightsCountry>NZ</RightsCountry>")
    sr.rights_territories = ["ECZ", "ROW"]
    expect(sr).to include_the_xml("<RightsTerritory>ECZ ROW</RightsTerritory>")
  end

  it "should provide an array for deprecated rights regions" do
    p = ONIX::Product.from_xml(@root.to_s)
    expect(p.sales_rights[2].rights_region).to eql([0,1,2,3])
  end

end
