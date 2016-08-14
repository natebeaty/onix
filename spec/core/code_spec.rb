# coding: utf-8

require 'spec_helper.rb'

describe ONIX::Code, "instantiation" do

  it "should raise an error for an invalid codelist number" do
    expect { ONIX::Code.new(500, 1) }.to raise_error
  end

  it "should find the codelist from a valid number" do
    expect(ONIX::Code.new(1,1).list).to be_a_kind_of(Hash)
  end

  it "should turn all-digit string keys into integers" do
    expect(ONIX::Code.new(1, "05").key).to eql(5)
    expect(ONIX::Code.new(1, 5).key).to eql(5)
  end

  it "should not turn part-digit and no-digit keys into integers" do
    expect(ONIX::Code.new(78, "P102").key).to eql("P102")
    expect(ONIX::Code.new(66, "Y").key).to eql("Y")
  end

  it "should find the correct value for a key" do
    expect(ONIX::Code.new(78, "D315").value).to eql("Nintendo Wii")
  end

  it "should find the correct key for a value" do
    expect(ONIX::Code.new(78, "Nintendo Wii").key).to eql("D315")
  end

  it "should turn all-digit key into integer when found by value" do
    expect(ONIX::Code.new(1, "Early notification").key).to eql(1)
  end

  it "should say code is invalid for an unmatched key or value" do
    expect(ONIX::Code.new(1, 9999).valid?).to be_falsey
    expect(ONIX::Code.new(1, 1).valid?).to be_truthy
  end

  it "should pad to_s output if initialised with integer key and length" do
    expect(ONIX::Code.new(1, 1, :length => 2).to_s).to eql("01")
  end

end
