require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/Word'

get '/' do
  @words = Word.all
  erb :index
end

get '/word/new' do
  erb :words_form
end

post '/word' do
  @word = Word.new(:new_word => params.fetch('word'))
  @word.save
  erb :word_definition_form
end

get '/word/:id' do
  @word = Word.find(params.fetch('id').to_i)
  erb :display_word
end

get '/word/<%= @word.id%>/definitions/new' do
    @word = Word.find(params.fetch('id').to_i())
    erb :word_definition_form
end

post '/definitions' do
  @word = Word.find(params.fetch('word_id').to_i)
  @definition = Definition.new(:new_definition => params.fetch('definition'))
  @definition.save
  @definitions = Definition.all
  @word = Word.find(params.fetch('word_id').to_i)
  @word.add_definition(@definition)
  @definitions = Definition.all
  erb :display_definitions
end
