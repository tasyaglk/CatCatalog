import Foundation

// MARK: - ApiServiceProtocol
protocol ApiServiceProtocol {
    
    // MARK: Fetch Breeds
    /// Метод для получения пород с заданного URL
    ///
    /// - Parameters:
    ///   - url: URL-адрес для запроса
    ///   - completion: Замыкание, вызываемое после завершения запроса
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], ApiError>) -> Void)
}
