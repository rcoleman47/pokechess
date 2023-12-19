
import Foundation

struct Sprites: Decodable {
    let frontDefault: String
    let backDefault: String
    let otherArt: OtherArt

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
        case otherArt = "other"
    }
}
