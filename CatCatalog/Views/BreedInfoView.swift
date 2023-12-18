import SwiftUI

struct BreedInfoView: View {
    
    // MARK: - Properties
    let breed: Breed
    let imageSize: CGFloat = 300
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                
                // MARK: Image View
                if breed.image?.url != nil {
                    AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .frame(height: imageSize)
                                .clipped()
                        } else if phase.error != nil {
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(Color.pink)
                                .frame(width: imageSize, height: imageSize)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }
                    }
                } else {
                    Color.gray.frame(height: imageSize)
                }
                
                // MARK: Breed Information
                VStack(alignment: .leading, spacing: 15) {
                    Text(breed.name)
                        .font(.headline)
                    Text(breed.temperament)
                        .font(.footnote)
                    Text(breed.breedExplaination)
                    if breed.isHairless {
                        Text("Hairless")
                            .foregroundColor(.red)
                    }
                    
                    // MARK: Origin
                    HStack {
                        Text("Origin: ")
                        Spacer()
                        Text(breed.origin)
                            .fontWeight(.bold)
                    }
                    
                    // MARK: Life Span
                    HStack {
                        Text("Life span: ")
                        Spacer()
                        Text(breed.lifeSpan)
                            .fontWeight(.bold)
                    }
                    
                    // MARK: Energy Level
                    HStack {
                        Text("Energy level")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "star.fill")
                                .foregroundColor(breed.energyLevel > id ? Color.yellow : Color.gray )
                        }
                    }
                    
                    // MARK: Friendly Ratings
                    VStack {
                        Text("Friendly")
                            .fontWeight(.bold)
                            .padding(.bottom, 10)
                        
                        // MARK: Dog Friendly
                        HStack {
                            Text("Dog")
                            Spacer()
                            ForEach(1..<6) { id in
                                Image(systemName: "star.fill")
                                    .foregroundColor(breed.dogFriendly > id ? Color.yellow : Color.gray )
                            }
                        }
                        
                        // MARK: Child Friendly
                        HStack {
                            Text("Child")
                            Spacer()
                            ForEach(1..<6) { id in
                                Image(systemName: "star.fill")
                                    .foregroundColor(breed.childFriendly > id ? Color.yellow : Color.gray )
                            }
                        }
                        
                        // MARK: Stranger Friendly
                        HStack {
                            Text("Stranger")
                            Spacer()
                            ForEach(1..<6) { id in
                                Image(systemName: "star.fill")
                                    .foregroundColor(breed.strangerFriendly > id ? Color.yellow : Color.gray )
                            }
                        }
                    }
                    .padding(.top, 10)
                    Spacer()
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
