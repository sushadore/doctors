require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'volunteer_tracker'})

get '/' do
  @projects = Project.all
  @volunteers = Volunteer.all
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
  @projects = Project.all
  erb :project
end

patch '/projects/:id' do
  @project = Project.find(params['id'].to_i)
  @project.update({:title => params['title']})
  @volunteers = Volunteer.all
  erb :project
end

delete '/projects/:id' do
  project = Project.find(params['id'].to_i)
  project.delete
  redirect '/'
end

get '/volunteers/new' do
  @projects = Project.all
  erb :volunteer_form
end

post '/volunteers' do
  project_id = params['project_id'].to_i
  volunteer = Volunteer.new(:volunteer_name => params['volunteer_name'], :project_id => project_id)
  volunteer.save
  @project = Project.find(project_id)
  @volunteers = Volunteer.all
  @projects = Project.all
  erb :index
end

get '/volunteers/:id'  do
  @volunteer = Volunteer.find(params['id'].to_i)
  erb :volunteer
end

patch '/volunteers/:id' do
  @volunteer = Volunteer.find(params['id'].to_i)
  @volunteer.update({:volunteer_name => params['volunteer_name']})
  erb :volunteer
end

delete '/volunteers/:id' do
  volunteer = Volunteer.find(params['id'].to_i)
  volunteer.delete
  redirect '/'
end
