require 'sinatra'
require 'sinatra/json'

get '/abc' do
  json 'hello world'
end

get '/abcd' do
  send_file 'public/index-2.html'
end
