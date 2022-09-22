//
//  APIService.swift
//  TMDB
//
//  Created by Jeeva Tamil on 22/09/22.
//

import Foundation

class APIService {
    
    public static var shared = APIService()
    private init() {}
    
    private func getData<T: Codable>(url: URL) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) else { throw APIError.ServerError }
            
            do {
                let decodedObj = try JSONDecoder().decode(T.self, from: data)
                return decodedObj
            } catch {
                throw APIError.DecodingError(errot: error.localizedDescription)
            }
        } catch {
            throw APIError.TransportError(error: error.localizedDescription)
        }
    }
    func getData<T: Codable>(url: URL?) async throws -> T {
        guard let url = url else { throw APIError.InvalidURLError }
        return try await getData(url: url)
    }
    
    func getData<T: Codable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { throw APIError.InvalidURLError }
        return try await getData(url: url)
    }
    
    func getData<T: Codable>(urlReq: URLRequest) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(for: urlReq)
            guard let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) else { throw APIError.ServerError }
            
            do {
                let decodedObj = try JSONDecoder().decode(T.self, from: data)
                return decodedObj
            } catch {
                throw APIError.DecodingError(errot: error.localizedDescription)
            }
        } catch {
            throw APIError.TransportError(error: error.localizedDescription)
        }
    }
}

enum APIError: Error, LocalizedError {
    case InvalidURLError, TransportError(error: String), ServerError, InvalidDataError, DecodingError(errot: String)
    
    var errorDescription: String {
        switch self {
        case .InvalidURLError:
            return "URL is not valid"
        case .TransportError(let error):
            return "Error on URLSessions - \(error)"
        case .ServerError:
            return "Invalid responce from the server"
        case .InvalidDataError:
            return "Invalid Data from the API"
        case .DecodingError(let error):
            return "Decoding error - \(error)"
        }
    }
}
