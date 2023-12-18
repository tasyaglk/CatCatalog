import SwiftUI

struct CatalogView: View {
    let breeds: [Breed]
    
    @State private var searchText: String = ""
    
    // MARK: - Computed Property for Filtered Breeds
    var filteredBreeds: [Breed] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBreeds) { breed in
                    NavigationLink {
                        // MARK: - Navigation Link to BreedInfoView
                        BreedInfoView(breed: breed)
                    } label: {
                        // MARK: - Breed Cell
                        BreedCell(breed: breed)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Cat Catalog")
            
            // MARK: - Search Bar
            .searchable(text: $searchText)
        }
    }
}
