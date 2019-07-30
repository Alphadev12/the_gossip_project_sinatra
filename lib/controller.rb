require 'gossip'

class ApplicationController < Sinatra::Base
	get '/' do
		erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossips/new/' do
		erb :new_gossip
	end

	post '/gossips/new/' do
		author = params["gossip_author"]
		content = params["gossip_content"]

		Gossip.new(author, content).save
		redirect '/'
	end

	get '/gossips/:id' do
		# data = Gossip.find(params['id'])

		# author = data[0]
		# content = data[1]
		gossip = Gossip.find(params['id'])

		erb :show, locals: {gossip: gossip, id: params["id"]}
	end

	get '/gossips/:id/edit/' do
		erb :edit, locals: {gossip: Gossip.find(params['id']), id: params["id"]}
	end

	post '/gossips/:id/edit/' do
		id = params["id"]
		author = params["gossip_author"]
		content = params["gossip_content"]
		
		Gossip.update(author,content,id)

		redirect "/gossips/#{id}"
	end
end