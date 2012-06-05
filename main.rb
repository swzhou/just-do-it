require 'sinatra'
require 'slim'
require './domain'

get '/' do
  @tasks = Task.all
  slim :index
end

post '/' do
  Task.create params[:task]
  redirect to('/')
end

get '/:task' do
  @task = params[:task].split('-').join(' ').capitalize
  slim :task
end