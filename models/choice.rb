class Choice
  include MongoMapper::Document
  key :title, String
  key :description, String
  key :image_url, String
  key :votes, Integer
  key :ip, String
  key :poll_id
  timestamps!
  
  def responses
    Response.where(choice_id: self.id)
  end
end