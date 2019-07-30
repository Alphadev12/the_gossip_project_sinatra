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
		data = Gossip.find(params['id'])

		author = data[0]
		content = data[1]

		erb :show, locals: {gossip: Gossip.new(author,content), id: params["id"]}
	end
end