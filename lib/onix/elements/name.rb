# coding: utf-8

class ONIX::Name < ONIX::NameBase
  xml_name "Name"
  xml_accessor :person_name, :from => "PersonName"
  xml_accessor :person_name_inverted, :from => "PersonNameInverted"
  onix_code_from_list :person_name_type, "PersonNameType", :list => 18
end
