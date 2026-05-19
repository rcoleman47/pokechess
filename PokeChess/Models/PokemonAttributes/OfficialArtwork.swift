
import Foundation
import SwiftData

@Model
class OfficialArtwork: Decodable {
    let frontDefault: String

    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

    init(frontDefault: String) {
        self.frontDefault = frontDefault
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        frontDefault = try container.decode(String.self, forKey: .frontDefault)
    }
}
