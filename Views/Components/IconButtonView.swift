//
//  IconButtonView.swift
//
//
//  Created by Clément Combier on 24/02/2024.
//

import SwiftUI

struct IconButtonView: View {
    
    var name: String
    var iconName: String
    
    var body: some View {
        
        Image(systemName: iconName) // Affiche l'icône
            .foregroundColor(.accentColor) // Personnalisez la couleur si nécessaire
        Text(name)
        
    }
}

