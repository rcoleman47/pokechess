
import Foundation
import SwiftData
import SwiftUI

final class PokemonViewModel: PokemonAPICalling {
    var pokemon = [Pokemon]()
    @Environment(\.modelContext) private var modelContext

    func onAppear() {
        Task {
            let collection = try await allPokemon()
            if let collection {
                self.pokemon.append(contentsOf: collection.pokeCollection)
            }
        }
    }
}
