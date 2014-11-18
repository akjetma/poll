class Response
  include MongoMapper::Document
  key :ip, String
  key :choice_id
  timestamps!

  def self.last_ip_response(ip)
    self.order(:created_at.desc).where(ip: ip).first
  end
end