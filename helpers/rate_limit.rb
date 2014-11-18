module RateLimitHelper
  def recent_voter?(ip)
    Response.last_ip_response(ip).created_at > Time.now - voting_period_length
  end

  def voting_period_length
    60*60*24
  end
end