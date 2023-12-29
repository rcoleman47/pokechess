
import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}

protocol PokemonAPICalling {}
extension PokemonAPICalling {
    func pokemon(withId id: Int) async throws -> Pokemon {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else {
            throw APIError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(Pokemon.self, from: data)
    }
}
