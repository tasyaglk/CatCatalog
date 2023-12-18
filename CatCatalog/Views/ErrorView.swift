import SwiftUI

struct ErrorView: View {
    // MARK: - Properties
    @ObservedObject var breedFetcher: BreedFetcher

    // MARK: - Body
    var body: some View {
        VStack {
            // MARK: Emoji
            Text("😿")
                .font(.system(size: 80))

            // MARK: Error Message
            Text(breedFetcher.errorMessage ?? "No cats today;(")

            // MARK: Try Again Button
            Button {
                breedFetcher.fetchAllBreeds()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    // MARK: - Previews
    static var previews: some View {
        ErrorView(breedFetcher: BreedFetcher())
    }
}
