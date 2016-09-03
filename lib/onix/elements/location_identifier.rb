# coding: utf-8

class ONIX::LocationIdentifier < ONIX::IdentifierBase
  xml_name "LocationIdentifier"
  onix_code_from_list :location_id_type, "LocationIDType", :list => 92
end


