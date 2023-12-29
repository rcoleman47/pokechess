
import Foundation
import SwiftData

@Model
class PokeType: Decodable {
    let name: String

    private enum CodingKeys: String, CodingKey {
        case name
    }

    init(name: String) {
        self.name = name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
}
