# coding: utf-8

# An abstract/base class to be inherited by actual ONIX identifier elements
#
class ONIX::IdentifierBase < ONIX::Element
  xml_accessor :id_value, :from => "IDValue"
  # Optional, only used if x_id_type indicates a proprietary id scheme.
  xml_accessor :id_type_name, :from => "IDTypeName"
end
