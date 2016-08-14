# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Header do

  before(:each) do
    load_doc_and_root("header.xml")
    @header_node = @root
  end

  it "should correctly convert to a string" do
    header = ONIX::Header.from_xml(@header_node.to_s)
    expect(header.to_xml.to_s[0,8]).to eql("<Header>")
  end

  it "should provide read access to first level attributes" do
    header = ONIX::Header.from_xml(@header_node.to_s)

    expect(header.from_ean_number).to eql("1111111111111")
    expect(header.from_san).to eql("1111111")
    expect(header.from_company).to eql("Text Company")
    expect(header.from_email).to eql("james@rainbowbooks.com.au")
    expect(header.from_person).to eql("James")

    expect(header.to_ean_number).to eql("2222222222222")
    expect(header.to_san).to eql("2222222")
    expect(header.to_company).to eql("Company 2")
    expect(header.to_person).to eql("Chris")

    expect(header.message_note).to eql("A Message")
    expect(header.message_repeat).to eql(1)
    expect(header.sent_date).to eql(Date.civil(2008,5,19))

    expect(header.default_language_of_text).to eql("aaa")
    expect(header.default_price_type_code).to eql(1)
    expect(header.default_currency_code).to eql("ccc")
    expect(header.default_linear_unit).to eql("dd")
    expect(header.default_weight_unit).to eql("ee")
    expect(header.default_class_of_trade).to eql("f")
  end

  it "should provide write access to first level attributes" do
    header = ONIX::Header.new

    header.from_ean_number = "1111111111111"
    #puts header.to_xml.to_s
    expect(header.to_xml.to_s.include?("<FromEANNumber>1111111111111</FromEANNumber>")).to be_truthy

    header.from_san = "1111111"
    expect(header.to_xml.to_s.include?("<FromSAN>1111111</FromSAN>")).to be_truthy

    header.from_company = "Text Company"
    expect(header.to_xml.to_s.include?("<FromCompany>Text Company</FromCompany>")).to be_truthy

    header.from_email = "james@rainbowbooks.com.au"
    expect(header.to_xml.to_s.include?("<FromEmail>james@rainbowbooks.com.au</FromEmail>")).to be_truthy

    header.from_person = "James"
    expect(header.to_xml.to_s.include?("<FromPerson>James</FromPerson>")).to be_truthy

    header.to_ean_number = "2222222222222"
    expect(header.to_xml.to_s.include?("<ToEANNumber>2222222222222</ToEANNumber>")).to be_truthy

    header.to_san = "2222222"
    expect(header.to_xml.to_s.include?("<ToSAN>2222222</ToSAN>")).to be_truthy

    header.to_company = "Company 2"
    expect(header.to_xml.to_s.include?("<ToCompany>Company 2</ToCompany>")).to be_truthy

    header.to_person = "Chris"
    expect(header.to_xml.to_s.include?("<ToPerson>Chris</ToPerson>")).to be_truthy

    header.message_note = "A Message"
    expect(header.to_xml.to_s.include?("<MessageNote>A Message</MessageNote>")).to be_truthy

    header.message_repeat = 1
    expect(header.to_xml.to_s.include?("<MessageRepeat>1</MessageRepeat>")).to be_truthy

    header.sent_date = Date.civil(2008,5,19)
    expect(header.to_xml.to_s.include?("<SentDate>20080519</SentDate>")).to be_truthy

    header.default_language_of_text = "aaa"
    expect(header.to_xml.to_s.include?("<DefaultLanguageOfText>aaa</DefaultLanguageOfText>")).to be_truthy

    header.default_price_type_code = 1
    expect(header.to_xml.to_s.include?("<DefaultPriceTypeCode>01</DefaultPriceTypeCode>")).to be_truthy

    header.default_currency_code = "ccc"
    expect(header.to_xml.to_s.include?("<DefaultCurrencyCode>ccc</DefaultCurrencyCode>")).to be_truthy

    header.default_class_of_trade = "f"
    expect(header.to_xml.to_s.include?("<DefaultClassOfTrade>f</DefaultClassOfTrade>")).to be_truthy
  end

  it "should correctly handle text with & < and >" do
    header = ONIX::Header.new

    header.from_company = "James & Healy"
    expect(header.to_xml.to_s.include?("James &amp; Healy")).to be_truthy

    header.from_company = "James < Healy"
    expect(header.to_xml.to_s.include?("James &lt; Healy")).to  be_truthy

    header.from_company = "James > Healy"
    expect(header.to_xml.to_s.include?("James &gt; Healy")).to  be_truthy
  end
end

describe ONIX::Header do

  it "should correctly handle headers with an invalid sent date" do
    file = find_data_file("header_invalid_sentdate.xml")
    header = ONIX::Header.from_xml(File.read(file))

    expect(header.sent_date).to be_nil
  end
end
