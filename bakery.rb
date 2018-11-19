require 'sinatra'
require 'json'
require 'curb'

get '/' do
  erb :home
end

get '/cookies' do
  erb :cookies
end

get '/muffins' do
  erb :muffins
end

get '/cakes' do
  erb :cakes
end

get '/events' do
@result = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search/?q=bakery&token=XXXXXXXXXXXXXXXXXXXX")
@data = @result.body_str
@parsed = JSON.parse(@data)
@events = @parsed['events']
erb :events
end


# get '/events' do
# @result = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search/?q=bakery&token=#{ ENV['API_TOKEN'] }")
# @data = @result.body_str
# @parsed = JSON.parse(@data)
# @events = @parsed['events']
# erb :events
# end
# API_TOKEN=XXXXXXXXXXXXXXXXXXXX

class Baked
  attr_accessor :description, :price
  def initialize(description, price)
    @description = description
    @price = price
  end
end
