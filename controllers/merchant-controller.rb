require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/merchant')
also_reload('../models/*')

# display

get '/merchants' do
  @merchants = Merchant.all()
  erb(:"merchant/index")
end

# add new merchant

get '/merchants/new' do
  erb(:"merchant/new")
end

post '/merchants' do
  @merchant = Merchant.new( params )
  @merchant.save()
  redirect to '/merchants'
end

# delete merchant

post '/merchants/:id/delete' do
  Merchant.delete(params[:id])
  redirect to '/merchants'
end

# edit

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchant/edit")
end

post '/merchants/:id/edit' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to '/merchants'
end
