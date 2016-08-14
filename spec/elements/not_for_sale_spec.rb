# coding: utf-8

require 'spec_helper.rb'

describe ONIX::NotForSale do

  before(:each) do
    load_doc_and_root("sales_rights.xml")
    @nfs = @root.at_css("NotForSale")
  end


  it "should correctly convert to a string" do
    rep = ONIX::NotForSale.from_xml(@nfs.to_s)
    expect(rep).to produce_the_tag("<NotForSale>")
  end


  it "should provide read access to first level attributes" do
    p = ONIX::Product.from_xml(@root.to_s)
    expect(p.not_for_sales[0].rights_countries).to eql(["GB"])
  end


  it "should provide write access to first level attributes" do
    nfs = ONIX::NotForSale.new
    nfs.rights_countries = ["GB", "US", "IE"]
    expect(nfs).to include_the_xml("<RightsCountry>GB</RightsCountry>")
    expect(nfs).to include_the_xml("<RightsCountry>US</RightsCountry>")
    expect(nfs).to include_the_xml("<RightsCountry>IE</RightsCountry>")
  end

end
