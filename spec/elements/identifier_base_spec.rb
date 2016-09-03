# coding: utf-8

require 'spec_helper.rb'

describe ONIX::IdentifierBase do

  before(:each) do
    load_doc_and_root('identifier_base.xml')
  end

  it 'should correctly convert to a string' do
    node = ONIX::IdentifierBase.from_xml(@root.to_s)
    expect(node).to produce_the_tag('<identifierbase>')
  end

  it 'should provide read access to first level attributes' do
    node = ONIX::IdentifierBase.from_xml(@root.to_s)
    expect(node.id_type_name).to eql('Proprietary')
    expect(node.id_value).to eql('123456')
  end

  it 'should provide write access to first level attributes' do
    node = ONIX::IdentifierBase.new

    node.id_type_name = 'Proprietary'
    expect(node).to include_the_xml('<IDTypeName>Proprietary</IDTypeName>')

    node.id_value = '123456'
    expect(node).to include_the_xml('<IDValue>123456</IDValue>')
  end

end
