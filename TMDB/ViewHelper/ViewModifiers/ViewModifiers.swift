//
//  ViewModifiers.swift
//  TMDB
//
//  Created by Jeeva Tamil on 23/09/22.
//

import SwiftUI

struct LoadingViewModifier: ViewModifier {
    var isLoading: Bool
    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                LoadingView()
            }
        }
    }
}
