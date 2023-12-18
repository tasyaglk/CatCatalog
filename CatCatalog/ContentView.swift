import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    // Создание экземпляра BreedFetcher с использованием @StateObject
    @StateObject var fetch = BreedFetcher()
    
    // MARK: - Body
    var body: some View {
        // MARK: Loading State
        if fetch.isLoading {
            LoadingView()
        }
        // MARK: Error State
        else if fetch.errorMessage != nil {
            ErrorView(breedFetcher: fetch)
        }
        // MARK: Success State
        else {
            CatalogView(breeds: fetch.breeds)
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
