load 'environment.rb'
task :generate_christmas_movie_poll do
  p = Poll.first_or_create(title: "What christmas movie are we going to watch?", description: "A soon to be happy holidays to everyone! Last year, we had a fabulous time watching Die Hard. What movie are we going to watch this year, folks? Below you'll find a poll where you can vote on existing movies, or add your own! Let's make this year the best ever. <br> <br> <br> <br> <h2>For the uninitiated</h2>Last year, we had a party at the <a href='http://cstpdx.com'>Clinton Street Theater</a>, where we gave out free drinks (wine and beer only, that's the policy) a few days before Christmas. The reason was simple: Christmas is about fun and giving gifts, and what better gift than a night full of screaming funny things at a screen with your friends while you knock more than a few back? This year, we're looking to make it an even more fun party! We want to fill the place up to capacity, and as part of that, we want your input - what movie do *you* want to watch? Titanic? It's a Wonderful Life? Silence of the Lambs? Your call. Throw it in, get your friends to vote, and show up to the party. As we get closer to the big night (TBD), the official night and time will be posted - the winner will be selected the day of, at which point we'll go buy the movie and that'll be that. Let's have fun, and also, remember that the holidays are great and spread cheer in whatever way you can!")
  choices = [
    Choice.first_or_create(image_url: "http://upload.wikimedia.org/wikipedia/en/7/7e/Die_hard.jpg", title: "Die Hard", description: "The classic holiday action movie.", ip: "24.61.9.153", poll_id: p.id, votes: 0),
    Choice.first_or_create(image_url: "http://upload.wikimedia.org/wikipedia/en/d/d9/Lethal_weapon1.jpg", title: "Lethal Weapon", description: "It takes place on Christmas. It's got Gibson hair. 'Nuff said.", ip: "24.61.9.153", poll_id: p.id, votes: 0),
    Choice.first_or_create(image_url: "http://upload.wikimedia.org/wikipedia/en/4/47/Home_alone.jpg", title: "Home Alone", description: "Christmas? At O'Hare!? Who could ask for more.", ip: "24.61.9.153", poll_id: p.id, votes: 0),
    Choice.first_or_create(image_url: "http://upload.wikimedia.org/wikipedia/en/8/86/The_Silence_of_the_Lambs_poster.jpg", title: "Silence of the Lambs", description: "Because who doesn't want to repeatedly yell \"Would you fuck me? I Would fuck me.\" over and over.", ip: "24.61.9.153", poll_id: p.id, votes: 0),
    Choice.first_or_create(image_url: "http://17116613.r.lightningbase-cdn.com/moviereviews/files/2014/10/reindeer-games-poster.jpg", title: "Reindeer Games", description: "Sounds pretty legit. Also definitely a christmas movie.", ip: "24.61.9.153", poll_id: p.id, votes: 0)
  ]
end

task :clean_mess do
  Response.distinct(:ip).each do |ip|
    responses = Response.where(ip: ip).order(:created_at.asc).all
    responses[1..-1].each(&:destroy)
  end

  Choice.all.each do |choice|
    choice.votes = choice.responses.count
    choice.save!
  end
end

task :clear do
  Poll.destroy_all
  Choice.destroy_all
  Response.destroy_all
end