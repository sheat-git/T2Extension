//
//  View.swift
//  T2Extension
//
//  Created by 大畑允人 on 2022/01/02.
//

import SwiftUI

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
                
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .background(Color.systemBackground)
            }
        }
        .navigationViewStyle(.stack)
    }
}
