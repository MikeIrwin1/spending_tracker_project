require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction')
also_reload('../models/*')

# inital display

get '/transactions' do
  @budgets = Budget.all()
  @transactions = Transaction.all()
  erb(:"transaction/index")
end

# delete transaction

post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to '/transactions'
end

# new transaction

get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()

  erb(:"transaction/new")
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to '/transactions'
end


# edit transaction

get '/transactions/:id/edit' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transaction = Transaction.find(params[:id])
  erb(:"transaction/edit")
end

post '/transactions/:id/edit' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to '/transactions'
end
