
import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}

protocol PokemonAPICalling {}
extension PokemonAPICalling {
    func allPokemon() async throws -> PokemonCollection? {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=386") else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            do {
                let decodedData =  try JSONDecoder().decode(PokemonCollection.self, from: data)
                return decodedData
            } catch {
                print(error.localizedDescription)
            }
        }

        return nil
    }

    func pokemon(from urlString: String) async throws -> PokemonAttributes {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(PokemonAttributes.self, from: data)
    }
}
