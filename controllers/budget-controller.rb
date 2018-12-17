require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/budget')
also_reload('../models/*')

# display

get '/budgets' do
  @budgets = Budget.all()
  erb(:"budget/index")
end

# edit budget

get '/budgets/:id/edit' do
  @budget = Budget.find(params[:id])
  erb(:"budget/edit")
end

post '/budgets/:id/edit' do
  budget = Budget.new(params)
  budget.update
  redirect to '/budgets'
end
