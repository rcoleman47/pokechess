
import Foundation
import SwiftData

@Model
class Types: Decodable {
    let type: PokeType

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    init(type: PokeType) {
        self.type = type
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(PokeType.self, forKey: .type)
    }
}
