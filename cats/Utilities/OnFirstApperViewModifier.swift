//
//  OnFirstApperViewModifier.swift
//  cats
//
//  Created by Lukáš Frajt on 09.06.2023.
//

import SwiftUI

struct OnFirstAppearViewModifier: ViewModifier {
    @State private var viewDidAppear = false
    
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if !viewDidAppear {
                viewDidAppear = true
                
                action?()
            }
        }
    }
}

extension View {
    func onFirstAppear(perform action: (() -> Void)? = nil) -> some View {
        modifier(
            OnFirstAppearViewModifier(perform: action)
        )
    }
}

