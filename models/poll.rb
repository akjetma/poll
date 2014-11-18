class Poll
  include MongoMapper::Document
  key :title, String
  key :description, String
  timestamps!
  
  def choices
    Choice.where(poll_id: self.id)
  end
end