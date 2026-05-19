
import Foundation
import SwiftData

@Model
class OtherArt: Decodable {
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }

    init(officialArtwork: OfficialArtwork) {
        self.officialArtwork = officialArtwork
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        officialArtwork = try container.decode(OfficialArtwork.self, forKey: .officialArtwork)
    }
}
