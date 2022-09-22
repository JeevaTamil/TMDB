//
//  LoadingView.swift
//  TMDB
//
//  Created by Jeeva Tamil on 23/09/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 5) {
            ProgressView()
            Text("Loading")
        }
        .background {
            Rectangle()
                .fill(Material.regular)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
