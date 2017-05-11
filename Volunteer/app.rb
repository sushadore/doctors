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

post '/projects' do
  project = Project.new(:title => params['title'])
  project.save
  redirect '/'
end

get '/projects/:id'  do
  @project = Project.find(params['id'].to_i)
  @volunteers = Volunteer.all
  erb :project
end

patch '/projects/:id' do
  @project = Project.find(params['id'].to_i)
  @project.update({:title => params['title']})
  @volunteers = Volunteer.all
  erb :project
end

delete '/projects/:id' do
  @project = Project.find(params['id'].to_i)
  @project.delete
  redirect '/'
end

get '/volunteers/new' do
  @project = Project.all
  erb :volunteer_form
end

post '/volunteers/new' do
  project_id = params['project_id'].to_i
  volunteer = Volunteer.new(:name => params['name'], :project_id => project_id)
  volunteer.save
  @project = Project.find(project_id)
  redirect '/'
end

get '/volunteers/:id'  do
  @volunteer = Volunteer.find(params['id'].to_i)
  erb :volunteer
end
