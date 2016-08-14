# coding: utf-8

require 'spec_helper.rb'

describe ONIX::MediaFile do

  before(:each) do
    load_doc_and_root("media_file.xml")
  end

  it "should correctly convert to a string" do
    mf = ONIX::MediaFile.from_xml(@root.to_s)
    expect(mf.to_xml.to_s[0,11]).to eql("<MediaFile>")
  end

  it "should provide read access to first level attributes" do
    mf = ONIX::MediaFile.from_xml(@root.to_s)
    expect(mf.media_file_type_code).to eql(4)
    expect(mf.media_file_link_type_code).to eql(1)
    expect(mf.media_file_link).to eql("http://www.allenandunwin.com/BookCovers/resized_9788888028729_224_297_FitSquare.jpg")
  end

  it "should provide write access to first level attributes" do
    mf = ONIX::MediaFile.new

    mf.media_file_type_code = 2
    expect(mf.to_xml.to_s.include?("<MediaFileTypeCode>02</MediaFileTypeCode>")).to be_truthy

    mf.media_file_link_type_code = 1
    expect(mf.to_xml.to_s.include?("<MediaFileLinkTypeCode>01</MediaFileLinkTypeCode>")).to be_truthy

    mf.media_file_link = "http://www.google.com"
    expect(mf.to_xml.to_s.include?("<MediaFileLink>http://www.google.com</MediaFileLink>")).to be_truthy
  end

end

