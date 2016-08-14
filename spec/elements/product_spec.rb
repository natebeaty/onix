# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Product do

  before(:each) do
    load_doc_and_root("product.xml")
    @product_node = @root
  end

  it "should provide read access to first level attributes" do
    product = ONIX::Product.from_xml(@product_node.to_s)

    expect(product.record_reference).to eql("365-9780194351898")
    expect(product.notification_type).to eql(3)
    expect(product.product_form).to eql("BC")
    expect(product.edition_number).to eql(1)
    expect(product.number_of_pages).to eql(100)
    expect(product.bic_main_subject).to eql("EB")
    expect(product.publishing_status).to eql(4)
    expect(product.publication_date).to eql(Date.civil(1998,9,1))
    expect(product.year_first_published).to eql(1998)

    # epublication detail
    expect(product.epub_type).to eql(1)
    expect(product.epub_type_version).to eql("2.1")

    # including ye olde, deprecated ones
    expect(product.height).to eql(100)
    expect(product.width).to eql(BigDecimal.new("200.5"))
    expect(product.weight).to eql(300)
    expect(product.thickness).to eql(300)
    expect(product.dimensions).to eql("100x200")
  end

  it "should provide read access to product IDs" do
    product = ONIX::Product.from_xml(@product_node.to_s)
    expect(product.product_identifiers.size).to eql(3)
  end

  it "should provide read access to sets" do
    product = ONIX::Product.from_xml(@product_node.to_s)
    expect(product.sets.size).to eql(1)
  end

  it "should provide read access to titles" do
    product = ONIX::Product.from_xml(@product_node.to_s)
    expect(product.titles.size).to eql(1)
  end

  it "should provide read access to work_identifiers" do
    product = ONIX::Product.from_xml(@product_node.to_s)
    expect(product.work_identifiers.size).to eql(1)
  end

  it "should provide read access to subjects" do
    product = ONIX::Product.from_xml(@product_node.to_s)
    expect(product.subjects.size).to eql(1)
  end

  it "should provide read access to measurements" do
    product = ONIX::Product.from_xml(@product_node.to_s)
    expect(product.measurements.size).to eql(1)
  end

  it "should provide write access to first level attributes" do
    product = ONIX::Product.new

    product.notification_type = 3
    expect(product.to_xml.to_s.include?("<NotificationType>03</NotificationType>")).to be_truthy

    product.record_reference = "365-9780194351898"
    expect(product.to_xml.to_s.include?("<RecordReference>365-9780194351898</RecordReference>")).to be_truthy

    product.product_form = "BC"
    expect(product.to_xml.to_s.include?("<ProductForm>BC</ProductForm>")).to be_truthy

    product.edition_number = 1
    expect(product.to_xml.to_s.include?("<EditionNumber>1</EditionNumber>")).to be_truthy

    product.number_of_pages = 100
    expect(product.to_xml.to_s.include?("<NumberOfPages>100</NumberOfPages>")).to be_truthy

    product.bic_main_subject = "EB"
    expect(product.to_xml.to_s.include?("<BICMainSubject>EB</BICMainSubject>")).to be_truthy

    product.publishing_status = 4
    expect(product.to_xml.to_s.include?("<PublishingStatus>04</PublishingStatus>")).to be_truthy

    product.publication_date = Date.civil(1998,9,1)
    expect(product.to_xml.to_s.include?("<PublicationDate>19980901</PublicationDate>")).to be_truthy

    product.year_first_published = 1998
    expect(product.to_xml.to_s.include?("<YearFirstPublished>1998</YearFirstPublished>")).to be_truthy
  end

  it "should provide write access to sets" do
    product = ONIX::Product.new
    set = ONIX::Set.new
    expect { product.sets << set }.to change(product.sets, :size).by(1)
  end

  it "should provide write access to work_identifiers" do
    product = ONIX::Product.new
    wid = ONIX::WorkIdentifier.new
    expect { product.work_identifiers << wid }.to change(product.work_identifiers, :size).by(1)
  end

  it "should correctly from_xml files that have an invalid publication date" do
    file = find_data_file("product_invalid_pubdate.xml")
    product = ONIX::Product.from_xml(File.read(file))

    expect(product.bic_main_subject).to eql("VXFC1")
    expect(product.publication_date).to be_nil
  end

  it "should load an interpretation" do
    product = ONIX::Product.new
    product.interpret(ONIX::SpecInterpretations::Setters)
    product.title = "Grimm's Fairy Tales"
    expect(product.titles.first.title_text).to eql("Grimm's Fairy Tales")
  end

  it "should load several interpretations" do
    product = ONIX::Product.new
    product.interpret([
      ONIX::SpecInterpretations::Getters,
      ONIX::SpecInterpretations::Setters
    ])
    product.title = "Grimm's Fairy Tales"
    expect(product.title).to eql("grimm's fairy tales")
  end

  it "should pass on interpretations to other products" do
    product1 = ONIX::Product.new
    product1.interpret([
      ONIX::SpecInterpretations::Getters,
      ONIX::SpecInterpretations::Setters
    ])

    product2 = ONIX::Product.new
    product1.interpret_like_me(product2)
    product2.title = "Grimm's Fairy Tales"
    expect(product2.title).to eql("grimm's fairy tales")
  end

  it "should write EpubType data as three digits if data is FixNum" do
    product = ONIX::Product.new
    product.epub_type = 1
    expect(product.to_xml.to_s.include?("<EpubType>001</EpubType>")).to be_truthy
  end

end
