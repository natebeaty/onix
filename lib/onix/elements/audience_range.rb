# coding: utf-8

class ONIX::AudienceRange < ONIX::Element
  xml_name "AudienceRange"
  onix_code_from_list :audience_range_qualifier, "AudienceRangeQualifier", :list => 30
  onix_codes_from_list :audience_range_precisions, "AudienceRangePrecision", :list => 31
  xml_accessor :audience_range_values, :from => "AudienceRangeValue", :as => []

  # Overrides the inherited method that forms the XML object
  # representing this object. The override is necessary to "zip"
  # the "from - to" precision and value elements.
  #
  #   Inherited XML element order:
  #     AudienceRangeQualifier
  #     AudienceRangePrecision1
  #     AudienceRangePrecision2
  #     AudienceRangeValue1
  #     AudienceRangeValue2
  #
  #   Correct XML element order:
  #     AudienceRangeQualifier
  #     AudienceRangePrecision1
  #     AudienceRangeValue1
  #     AudienceRangePrecision2
  #     AudienceRangeValue2
  #
  def to_xml(params = {})
    params.reverse_merge!(
      :name => self.class.tag_name,
      :namespace => self.class.roxml_namespace
    )
    params[:namespace] = nil if ['*', 'xmlns'].include?(params[:namespace])
    str = [params[:namespace], params[:name]].compact.join(':')
    XML.new_node(str).tap do |root|
      refs = if self.roxml_references.present?
              self.roxml_references
             else
              self.class.roxml_attrs.map { |attr| attr.to_ref(self) }
             end
      # Add audience_range_qualifier as is
      refs[0].update_xml(root, refs[0].to_xml(self))
      # Zip audience_range_values with audience_range_precisions
      precisions = refs[1].to_xml(self)
      values = refs[2].to_xml(self)
      (0..precisions.size-1).each do |i|
        refs[1].update_xml(root, [precisions[i]])
        refs[2].update_xml(root, [values[i]])
      end
    end
  end

end
