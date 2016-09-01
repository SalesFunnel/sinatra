require 'sinatra'
require 'sinatra/config_file'
require 'sinatra/json'
require_relative 'apps/store/data_store'

register Sinatra::ConfigFile
set :environment, :test
# set :environments, %w{development test}
config_file 'config.yml'

set :public_folder, Proc.new { File.join(root, "public") }
set :port, 8080

get '/' do
  p settings.name
  send_file 'public/index-2.html'
end

# get '/:name' do
#   p params[:name]
#   send_file 'public/'+params[:name]+'.html'
# end

get '/getAllGridData' do
  json store.get_all_data
end

post '/updateItem' do
  p params
  store.update_item
  json 'true'
end

delete '/deleteItem' do
  p params
  store.delete_item
  json 'true'
end


def store
  DataStore.new(settings)
end

# get all_but('/index') do
#
# end

# set(:auth) do |*roles|   # <- notice the splat here
#   condition do
#     unless logged_in? && roles.any? {|role| current_user.in_role? role }
#       redirect "/login/", 303
#     end
#   end
# end