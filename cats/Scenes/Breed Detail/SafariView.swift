//
//  SafariView.swift
//  cats
//
//  Created by Lukáš Frajt on 11.06.2023.
//

import SwiftUI
import SafariServices

struct safari: UIViewControllerRepresentable {
    let url: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<safari>) -> SFSafariViewController{
        let controller = SFSafariViewController(url: URL(string: url)!)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<safari>) {
        
    }
}
