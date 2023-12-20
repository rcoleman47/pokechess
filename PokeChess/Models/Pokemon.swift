
import Foundation
import SwiftData

@Model
final class Pokemon: Decodable, PokemonAPICalling {
    let name: String
    let url: String
    var pokemonAttributes: PokemonAttributes? {
        get async throws {
            try await pokemon(from: url)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case name, url
    }

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        url = try container.decode(String.self, forKey: .url)
    }
}
