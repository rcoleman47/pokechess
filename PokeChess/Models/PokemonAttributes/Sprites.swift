
import Foundation
import SwiftData

@Model
class Sprites: Decodable {
    let frontDefault: String
    let backDefault: String
    let otherArt: OtherArt

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
        case otherArt = "other"
    }

    init(frontDefault: String, backDefault: String, otherArt: OtherArt) {
        self.frontDefault = frontDefault
        self.backDefault = backDefault
        self.otherArt = otherArt
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        frontDefault = try container.decode(String.self, forKey: .frontDefault)
        backDefault = try container.decode(String.self, forKey: .backDefault)
        otherArt = try container.decode(OtherArt.self, forKey: .otherArt)
    }
}
