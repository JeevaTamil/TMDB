//
//  PopularMoviesView.swift
//  TMDB
//
//  Created by Jeeva Tamil on 23/09/22.
//

import SwiftUI

struct PopularMoviesView: View {
    @EnvironmentObject var moviesViewModel: MoviesViewModel
    var body: some View {
        List {
            ForEach(moviesViewModel.popularMovies) { movie in
                VStack {
                    Text(movie.title)
                    Text(movie.releaseDate)
                        .font(.caption)
                }
            }
        }
        .loading(isLoading: moviesViewModel.isLoading)
        .alert(isPresented: $moviesViewModel.isErrorOccured, error: moviesViewModel.errorMsg, actions: {
            Button {
                
            } label: {
                Text("OK")
            }
            
        })
        .task {
            await moviesViewModel.getPopularMovies()
        }
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
            .environmentObject(MoviesViewModel())
    }
}
