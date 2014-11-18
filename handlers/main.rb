get "/" do
  @poll = Poll.first
  @choices = @poll.choices.order(:votes.desc)
  @voted = recent_voter?(request.ip) #people started being lame.
  @midi = "let_it_snow"
  erb :"index"
end

get "/vote/:choice_id" do
  c = Choice.first(id: params[:choice_id])
  if c.nil?
    flash[:error] = "Oops! Something got weird. Please try to vote one more time!"
    redirect "/"
  end

  if recent_voter?(request.ip)
    flash[:error] = "You just voted. Vote again at #{(Response.last_ip_response(request.ip).created_at+voting_period_length).strftime('%c')}"
    redirect "/"
  end

  c.votes += 1
  c.save!
  r = Response.new(ip: request.ip, choice_id: c.id)
  r.save!
  flash[:success] = "Thank you for your vote!"
  redirect "/"
end

post "/add" do
  c = Choice.new
  @prev_param = params
  [:title, :description, :image_url].each do |param|
    if param.nil? || param.empty?
      flash[:error] = "Sorry, but looks like you didn't fill in something. Please correct this mistake!"
      redirect "/"
    end
  end
  c.title = params[:title]
  c.description = params[:description]
  c.image_url = params[:image_url]
  c.poll_id = Poll.first.id
  c.ip = request.ip
  r = Response.new(ip: request.ip, choice_id: c.id)
  r.save!
  c.votes = 1
  c.save!
  flash[:success] = "Thank you for your vote!"
  redirect "/"
end

post "/remove/:choice_id" do
  c = Choice.first(id: params[:choice_id])
  if request.ip == c.ip
    c.destroy
  end
  redirect "/"
end
