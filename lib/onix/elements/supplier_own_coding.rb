# coding: utf-8

class ONIX::SupplierOwnCoding < ONIX::Element
  xml_name "SupplierOwnCoding"

  onix_code_from_list :supplier_code_type, "SupplierCodeType", :list => 165
  xml_accessor :supplier_code_value, :from => "SupplierCodeValue"

end
