require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag')
also_reload('../models/*')

# initial view

get '/tags' do
  @tags = Tag.all()
  erb(:"tag/index")
end

# add new tag

get '/tags/new' do
  erb(:"tag/new")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to '/tags'
end

# delete a tag

post '/tags/:id/delete' do
  Tag.delete(params[:id])
  redirect to '/tags'
end

# edit a tag

get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])
  erb(:"tag/edit")
end

post '/tags/:id/edit' do
  tag = Tag.new(params)
  tag.update
  redirect to '/tags'
end
