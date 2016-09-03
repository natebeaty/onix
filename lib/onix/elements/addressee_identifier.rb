# coding: utf-8

class ONIX::AddresseeIdentifier < ONIX::IdentifierBase
  xml_name "AddresseeIdentifier"
  onix_code_from_list :addressee_id_type, "AddresseeIDType", :list => 44
end
