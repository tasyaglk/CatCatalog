import Foundation

enum ApiError: Error, CustomStringConvertible {

    // MARK: Cases
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown

    // MARK: - Properties
    var localizedDescription: String {
        switch self {
        case .badURL, .parsing, .unknown:
            return "Something went wrong"
        case .badResponse(_):
            return "The connection to our server failed"
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong"
        }
    }
    
    // MARK: - CustomStringConvertible
    var description: String {
        switch self {
        case .unknown: return "unknown error"
        case .badURL: return "wrong URL"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)"
        }
    }
}
