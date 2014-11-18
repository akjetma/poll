class Response
  include MongoMapper::Document
  key :ip, String
  key :choice_id
  timestamps!
end