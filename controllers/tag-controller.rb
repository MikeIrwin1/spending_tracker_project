require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag')
also_reload('../models/*')

get '/tags' do
  erb(:"tag/index")
end
