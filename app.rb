require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/merchant-controller')
require_relative('controllers/tag-controller')
require_relative('controllers/transaction-controller')
require_relative('controllers/budget-controller')

get '/' do
  @budget = Budget.all().first
  @transactions = Transaction.all()
  erb(:index)
end
