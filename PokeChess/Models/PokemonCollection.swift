
import Foundation
import SwiftData

@Model
class PokemonCollection: Decodable {
    let name: String
    let url: String

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
