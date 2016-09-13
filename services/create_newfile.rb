require 'http'
require 'base64'

class CreateNewFile
  def self.call(slide_name:, document:)
    file_url = "http://localhost:9292/api/v1/courses/1/pdfs"
    base64_encode_document = Base64.strict_encode64(document)
    response = HTTP.accept('application/json')
                   .post(file_url,
                         json: {
                           slide_name: slide_name,
                           document: base64_encode_document
                           })
    new_file = response.parse
    response.code == 201 ? new_file : nil
  end
end
