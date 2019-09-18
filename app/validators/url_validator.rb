# https://stackoverflow.com/questions/7167895/rails-whats-a-good-way-to-validate-links-urls
class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    begin
      uri = URI.parse(value)
      # TODO: remove restriction to HTTP, allow ftp and such?
      resp = uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      resp = false
    end
    unless resp == true
      record.errors[attribute] << (options[:message] || "is not an url")
    end
  end
end
