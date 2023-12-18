import Foundation

class BreedFetcher: ObservableObject {
    
    // MARK: - Published Properties
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    // MARK: - Dependencies
    let service: ApiServiceProtocol
    
    // MARK: - Initialization
    init(service: ApiServiceProtocol = ApiService()) {
        self.service = service
        fetchAllBreeds()
    }
    
    // MARK: - Fetching Breeds
    func fetchAllBreeds() {
        
        isLoading = true
        errorMessage = nil
        
        // MARK: URL Configuration
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.thecatapi.com"
        components.path = "/v1/breeds"
        
        // MARK: URL Parameters
        var urlParams: [String: String?] {
            return [
              "api_key": "live_RFDXiVzIUPWDuSHL3JaHus6uuN3MhwQBkyNVtvjAkWrmEG4BeeF2315cupD6mRKc",
              "limit": String(1000),
            ]
        }
        
        components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        let apiURL = components.url
        
        // MARK: Fetch Breeds
        service.fetchBreeds(url: apiURL) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                // MARK: Handle Fetch Result
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let breeds):
                    print("--- success with \(breeds.count)")
                    self.breeds = breeds
                }
            }
        }
    }
}
