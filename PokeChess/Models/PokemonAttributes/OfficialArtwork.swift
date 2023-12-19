
import Foundation

struct OfficialArtwork: Decodable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
