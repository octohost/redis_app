require 'sinatra'
require 'redis'

redis = Redis.new(:host => "#{ENV['REDIS_PORT_6379_TCP_ADDR']}", :port => "#{ENV['REDIS_PORT_6379_TCP_PORT']}")
 
set :bind, '0.0.0.0'
 
set :logging, true
 
get '/' do
  @count = redis.incr "count"
  erb :index
end