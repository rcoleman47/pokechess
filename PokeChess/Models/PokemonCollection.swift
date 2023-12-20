
import Foundation
import SwiftData

@Model
final class PokemonCollection: Decodable {
    let pokeCollection: [Pokemon]

    private enum CodingKeys: String, CodingKey {
        case pokeCollection = "results"
    }

    init(pokeCollection: [Pokemon]) {
        self.pokeCollection = pokeCollection
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pokeCollection = try container.decode([Pokemon].self, forKey: .pokeCollection)
    }
}
