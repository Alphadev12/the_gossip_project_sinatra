require 'csv'

class Gossip
	attr_accessor :author, :content
	def initialize(author,content)
		@author = author
		@content = content
	end

	def save
		CSV.open('./db/gossip.csv', 'ab') do |csv|
			csv << [@author,@content]
		end
	end

	def self.all
		all_gossips = []

		# data = CSV.read('./db/gossip.csv')
		# data.each do |gossip|
		# 	all_gossips << gossip
		# end

		CSV.read("./db/gossip.csv").each do |csv_line|
    		all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
		
		return all_gossips
	end

	def self.find(id)
		id = id.to_i - 1

		data = CSV.read("./db/gossip.csv")

		return data[id]
	end
end