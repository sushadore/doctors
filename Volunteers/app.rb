require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require 'pg'

DB = PG.connect({:dbname => 'volunteer_tracker'})

get '/' do
  erb :index
end

get '/projects' do
    @projects = Project.all
  erb :project_form
end

post '/projects' do
  project = Project.new(:title => params['title'], :id => nil)
  project.save
  erb :project_form
end

get '/volunteers' do
  @volunteers = Volunteer.all
  erb :volunteer_form
end
