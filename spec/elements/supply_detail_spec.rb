# coding: utf-8

require 'spec_helper.rb'

describe ONIX::SupplyDetail do

  before(:each) do
    load_doc_and_root("supply_detail.xml")
  end

  it "should correctly convert to a string" do
    sd = ONIX::SupplyDetail.from_xml(@root.to_s)
    expect(sd.to_xml.to_s[0,14]).to eql("<SupplyDetail>")
  end

  it "should provide read access to first level attributes" do
    sd = ONIX::SupplyDetail.from_xml(@root.to_s)

    expect(sd.supplier_name).to eql("Rainbow Book Agencies")
    expect(sd.product_availability).to eql(21)
    expect(sd.stock).to be_a_kind_of(Array)
    expect(sd.stock.size).to eql(1)
    expect(sd.pack_quantity).to eql(16)
    expect(sd.prices).to be_a_kind_of(Array)
    expect(sd.prices.size).to eql(1)
  end

  it "should provide write access to first level attributes" do
    sd = ONIX::SupplyDetail.new

    sd.supplier_name = "RBA"
    expect(sd.to_xml.to_s.include?("<SupplierName>RBA</SupplierName>")).to be_truthy

    sd.supplier_role = 1
    expect(sd.to_xml.to_s.include?("<SupplierRole>01</SupplierRole>")).to be_truthy

    sd.availability_code = 2
    expect(sd.to_xml.to_s.include?("<AvailabilityCode>02</AvailabilityCode>")).to be_truthy

    sd.product_availability = 3
    expect(sd.to_xml.to_s.include?("<ProductAvailability>03</ProductAvailability>")).to be_truthy

    sd.pack_quantity = 12
    expect(sd.to_xml.to_s.include?("<PackQuantity>12</PackQuantity>")).to be_truthy
  end

end

