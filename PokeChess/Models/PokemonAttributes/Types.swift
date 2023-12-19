
import Foundation

struct Types: Decodable {
    let type: PokeType

    enum CodingKeys: String, CodingKey {
        case type = "type"
    }
}
