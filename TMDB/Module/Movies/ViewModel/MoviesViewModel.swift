//
//  MoviesViewModel.swift
//  TMDB
//
//  Created by Jeeva Tamil on 23/09/22.
//

import Foundation

class MoviesViewModel: ObservableObject {
    @Published var popularMovies: [PopularMovie] = []
    @Published var errorMsg: APIError?
    @Published var isErrorOccured: Bool = false
    @Published var isLoading: Bool = false
    
    @MainActor
    func getPopularMovies() async {
        defer {
            isLoading.toggle()
        }
        let service = ServiceLayer.PopularMovie
        isLoading.toggle()
        do {
            let popularMoviesResponse: PopularMovies = try await APIService.shared.getData(url: service.url)
            popularMovies = popularMoviesResponse.results
        } catch(let error) {
            errorMsg = error as? APIError
            isErrorOccured.toggle()
        }
       
    }
}
