require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker'})

get '/' do
  @projects = Project.all
  erb :index
end

get '/projects/new' do
  erb :project_form
end

post '/projects/new' do
 @project = Project.new(:title => params['title'])
 @project.save
  redirect '/'
end
