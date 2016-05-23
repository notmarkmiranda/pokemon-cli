require 'net/http'
require 'json'

class PokemonService
	
	def get(url: url = "http://pokeapi.co/api/v1/", path: path)
		uri = URI(url + path + "/")
		response = Net::HTTP.get_response(uri)
		JSON.parse(response.body)
	end

	def pokemon_information(info)
		path = "pokemon/#{info}"
		get(path: path)
	end

	def get_moves_for(pokemon)
		response = pokemon_information(pokemon)
		response["moves"].map { |move| move["name"] }
	end

	def evolutions(pokemon)
		response = pokemon_information(pokemon)
		response["evolutions"]
	end
end

