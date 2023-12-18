import SwiftUI

struct BreedCell: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            // MARK: - Image Section
            if breed.image?.url != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        // MARK: - Error Handling Section
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        // MARK: - Loading Section
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                    }
                }
            } else {
                // MARK: - Placeholder for No Image Section
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            // MARK: - Text Section
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
    }
}
