
import Foundation
import SwiftData

@Model
class Pokemon: Decodable {
    let name: String
    let id: Int
    let sprites: Sprites
    let types: [Types]

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
