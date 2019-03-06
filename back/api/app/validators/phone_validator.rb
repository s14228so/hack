class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A\d{10}$|^\d{11}\z/
      record.errors[attribute] << (options[:message] || "is not an phone")
    end
  end
end






