//
//  ServiceLayer.swift
//  TMDB
//
//  Created by Jeeva Tamil on 22/09/22.
//

import Foundation

enum ServiceLayer {
    case PopularMovie
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var accessToken: String {
        return "76b4688f8bcf9b5cHd446471e9d2408b4"
    }
    
    var queryParams: [String:String] {
        var apiKeyParam = ["api_key": accessToken]
        switch self {
        case .PopularMovie:
            return apiKeyParam
        }
    }
    
    var endPoint: String {
        switch self {
        case .PopularMovie:
            return "movie/popular/"
        }
    }
    
    var url: URL? {
        var u = URLComponents(string: baseURL + endPoint)
        u?.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        return u?.url
    }
}
