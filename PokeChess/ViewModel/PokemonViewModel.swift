
import Foundation
import SwiftData
import SwiftUI

@Observable
final class PokemonViewModel: PokemonAPICalling {
    var pokemon = [Pokemon]()
    var modelContext: ModelContext? = nil

    func onAppear() {
        fetchPokemonFromData(byGeneration: .first)
    }

    func fetchPokemonFromAPI(byGeneration gen: Generation) {
        Task {
            var pokemonArr = [Pokemon]()
            let group = DispatchGroup()

            for number in gen.pokemonNumbers{
                group.enter()
                let pokemon = try await pokemon(withId: number)
                pokemonArr.append(pokemon)
                modelContext?.insert(pokemon)
                group.leave()
            }

            group.notify(queue: .main) {
                self.pokemon.append(contentsOf: pokemonArr)
                try? self.modelContext?.save()
            }
        }
    }

    func fetchPokemonFromData(byGeneration gen: Generation) {
        let fetchDescriptor = FetchDescriptor<Pokemon>(
            predicate: #Predicate { 
                $0.id <= 151
            },
            sortBy: [SortDescriptor(\.id)]
        )

        if let pokemonCollection = try? modelContext?.fetch(fetchDescriptor), !pokemonCollection.isEmpty {
            pokemon.append(contentsOf: pokemonCollection)
        } else {
            fetchPokemonFromAPI(byGeneration: gen)
        }
    }
}

enum Generation {
    case first, second, third

    var pokemonNumbers: ClosedRange<Int> {
        switch self {
        case .first:
            return 1...151
        case .second:
            return 152...252
        case .third:
            return 253...386
        }
    }
}
