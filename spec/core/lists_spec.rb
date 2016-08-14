# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Lists, "list method" do

  it "should return a hash containing the ProductForm code list" do
    forms = ONIX::Lists.list(7)
    expect(forms).to be_a(Hash)
    expect(forms["BB"]).to eql("Hardback")
  end

end

describe ONIX::Lists, "product_form shortcut method" do

  it "should return a hash containing the ProductForm code list" do
    forms = ONIX::Lists.product_form
    expect(forms).to be_a(Hash)
    expect(forms["BB"]).to eql("Hardback")
  end

end

describe ONIX::Lists, "PRODUCT_FORM shortcut constant" do

  it "should return a hash containing the ProductForm code list" do
    forms = ONIX::Lists::PRODUCT_FORM
    expect(forms).to be_a(Hash)
    expect(forms["BB"]).to eql("Hardback")
  end

end
