
import Foundation
import SwiftData

@Model
final class PokemonAttributes: Decodable {
    @Attribute(.unique) let name: String
    @Attribute(.unique) let id: Int
    @Relationship(deleteRule: .cascade) let sprites: Sprites
    @Relationship(deleteRule: .cascade) let types: [Types]
    var frontImageURLString: String {
        sprites.frontDefault
    }

    var backImageURLString: String {
        sprites.backDefault
    }

    var officialImageURLString: String {
        sprites.otherArt.officialArtwork.frontDefault
    }

    var parsedTypes: [String] {
        types.map { $0.type.name }
    }

    private enum CodingKeys: String, CodingKey {
        case name, id, sprites, types
    }

    init(name: String, id: Int, sprites: Sprites, types: [Types]) {
        self.name = name
        self.id = id
        self.sprites = sprites
        self.types = types
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(Int.self, forKey: .id)
        sprites = try container.decode(Sprites.self, forKey: .sprites)
        types = try container.decode([Types].self, forKey: .types)
    }
}
