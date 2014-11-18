require 'pry'
require 'mongo_mapper'
require 'hashie'
require 'oauth'
require 'sinatra'
require 'sinatra/flash'
require 'oauth'

Dir[File.dirname(__FILE__) + '/extensions/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/handlers/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/before_hooks/*.rb'].each {|file| require file }


set :erb, :layout => :'layouts/main'
enable :sessions
MongoMapper.connection = Mongo::MongoClient.new(:pool_size => 25, :pool_timeout => 60)
MongoMapper.database = "ferguson"

helpers LayoutHelper

class String
  def faderize
    set = []
    self.split("").each_with_index do |l, i|
      if i % 2 == 0
        set << "<FONT COLOR=\"FF0000\">#{l}</FONT>"
      else
        set << "<FONT COLOR=\"00FF00\">#{l}</FONT>"
      end
    end
    set.join("")
  end
end