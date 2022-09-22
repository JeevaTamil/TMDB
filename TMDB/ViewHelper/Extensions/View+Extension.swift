//
//  View+Extension.swift
//  TMDB
//
//  Created by Jeeva Tamil on 23/09/22.
//

import SwiftUI

extension View {
    func loading(isLoading: Bool) -> some View {
        return self.modifier(LoadingViewModifier(isLoading: isLoading))
    }
}
