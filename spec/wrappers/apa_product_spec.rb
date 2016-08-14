# coding: utf-8

require 'spec_helper.rb'
require 'date'

describe "ONIX::APAProduct" do

  before(:each) do
    load_doc_and_root("product.xml")
    @product_node = @root
  end

  it "should provide read access to attributes" do
    @product = ONIX::Product.from_xml(@product_node.to_s)
    @apa     = ONIX::APAProduct.new(@product)

    expect(@apa.record_reference).to eql("365-9780194351898")
    expect(@apa.notification_type).to eql(3)
    expect(@apa.product_form).to eql("BC")
    expect(@apa.number_of_pages).to eql(100)
    expect(@apa.bic_main_subject).to eql("EB")
    expect(@apa.publishing_status).to eql(4)
    expect(@apa.publication_date).to eql(Date.civil(1998,9,1))
    expect(@apa.pack_quantity).to eql(12)
  end

  it "should provide write access to attributes" do
    apa = ONIX::APAProduct.new

    apa.notification_type = 3
    expect(apa.to_xml.to_s.include?("<NotificationType>03</NotificationType>")).to be_truthy

    apa.record_reference = "365-9780194351898"
    expect(apa.to_xml.to_s.include?("<RecordReference>365-9780194351898</RecordReference>")).to be_truthy

    apa.product_form = "BC"
    expect(apa.to_xml.to_s.include?("<ProductForm>BC</ProductForm>")).to be_truthy

    apa.number_of_pages = 100
    expect(apa.to_xml.to_s.include?("<NumberOfPages>100</NumberOfPages>")).to be_truthy

    apa.bic_main_subject = "EB"
    expect(apa.to_xml.to_s.include?("<BICMainSubject>EB</BICMainSubject>")).to be_truthy

    apa.publishing_status = 4
    expect(apa.to_xml.to_s.include?("<PublishingStatus>04</PublishingStatus>")).to be_truthy

    apa.publication_date = Date.civil(1998,9,1)
    expect(apa.to_xml.to_s.include?("<PublicationDate>19980901</PublicationDate>")).to be_truthy

    apa.pack_quantity = 12
    expect(apa.to_xml.to_s.include?("<PackQuantity>12</PackQuantity>")).to be_truthy
  end

end

describe ONIX::APAProduct, "series method" do
  it "should set the nested series value on the underlying product class" do
    apa = ONIX::APAProduct.new

    apa.series = "Harry Potter"
    expect(apa.series).to eql("Harry Potter")
    expect(apa.to_xml.to_s.include?("<TitleOfSeries>Harry Potter</TitleOfSeries>")).to be_truthy
  end
end

describe ONIX::APAProduct, "price method" do
  before(:each) do
    load_doc_and_root("usd.xml")
    @product_node = @root
  end

  it "should return the first price in the file, regardless of type" do
    @product = ONIX::Product.from_xml(@product_node.to_s)
    @apa     = ONIX::APAProduct.new(@product)

    expect(@apa.price).to eql(BigDecimal.new("99.95"))
  end
end

describe ONIX::APAProduct, "rrp_exc_sales_tax method" do
  before(:each) do
    load_doc_and_root("usd.xml")
    @product_node = @root
  end

  it "should return the first price in the file of type 1" do
    @product = ONIX::Product.from_xml(@product_node.to_s)
    @apa     = ONIX::APAProduct.new(@product)

    expect(@apa.rrp_exc_sales_tax).to eql(BigDecimal.new("99.95"))
  end
end
