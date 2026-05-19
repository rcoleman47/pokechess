
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var viewModel: PokemonViewModel

    init() {
        _viewModel = State(initialValue: PokemonViewModel())
    }

    var body: some View {
        if viewModel.pokemon.isEmpty {
            ProgressView()
        }

        List {
            ForEach(viewModel.pokemon) { pokemon in
                Text(pokemon.name)
            }
        }
        .onAppear {
            viewModel.modelContext = modelContext
            viewModel.onAppear()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Pokemon.self, inMemory: true)
}
