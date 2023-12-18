import Foundation

struct Breed: Codable, Identifiable {
    
    // MARK: - Properties
    let id: String
    let name: String
    let temperament: String
    let breedExplaination: String
    let energyLevel: Int
    let isHairless: Bool
    let lifeSpan: String
    let dogFriendly: Int
    let childFriendly: Int
    let strangerFriendly: Int
    let origin: String
    let image: BreedImage?
    
    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case lifeSpan = "life_span"
        case dogFriendly = "dog_friendly"
        case childFriendly = "child_friendly"
        case strangerFriendly = "stranger_friendly"
        case origin
        case image
    }
    
    // MARK: - Initializers
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        lifeSpan = try values.decode(String.self, forKey: .lifeSpan)
        dogFriendly = try values.decode(Int.self, forKey: .dogFriendly)
        childFriendly = try values.decode(Int.self, forKey: .childFriendly)
        strangerFriendly = try values.decode(Int.self, forKey: .strangerFriendly)
        origin = try values.decode(String.self, forKey: .origin)
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
    }
    
    init(name: String, id: String, explaination: String, temperament: String,
         energyLevel: Int, isHairless: Bool, lifeSpan: String, dogFriendly: Int, childFriendly: Int, strangerFriendly: Int, origin: String, image: BreedImage?){
        self.name = name
        self.id = id
        self.breedExplaination = explaination
        self.energyLevel = energyLevel
        self.temperament = temperament
        self.image = image
        self.isHairless = isHairless
        self.lifeSpan = lifeSpan
        self.dogFriendly = dogFriendly
        self.childFriendly = childFriendly
        self.strangerFriendly = strangerFriendly
        self.origin = origin
    }
    
}
