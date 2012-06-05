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

delete '/task/:id' do
  Task.get(params[:id]).destroy
  redirect to('/')
end

put '/task/:id' do
  task = Task.get params[:id]
  task.completed_at = task.completed_at.nil? ? Time.now : nil
  task.save
  redirect to('/')
end

get '/:task' do
  @task = params[:task].split('-').join(' ').capitalize
  slim :task
end