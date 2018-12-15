require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/merchant-controller')
require_relative('controllers/tag-controller')
require_relative('controllers/transaction-controller')

get '/' do
  erb(:index)
end
