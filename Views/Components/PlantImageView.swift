//
//  PlantImageView.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import SwiftUI

struct PlantImageView: View {
    var growthStage: Int // The current growth stage of the plant
        
        var body: some View {
            Image("plantStage\(growthStage)")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                // Additional styling or animations can be added here
        }
}
