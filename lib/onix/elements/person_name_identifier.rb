# coding: utf-8

class ONIX::PersonNameIdentifier < ONIX::IdentifierBase
  xml_name "PersonNameIdentifier"
  onix_code_from_list :person_name_id_type, "PersonNameIDType", :list => 101
end
