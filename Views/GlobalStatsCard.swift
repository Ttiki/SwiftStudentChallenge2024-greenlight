//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 09/02/2024.
//

import SwiftUI

struct GlobalStatsCard: View {
    var title: String
    var stats: String
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("Primary")) // Use your primary color here
                .padding(.top, 10)
            
            Spacer()
            
            Text(stats)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("Action")) // Use your action color here
                .padding(.bottom, 10)
        }
        .frame(width: 200, height: 200)
        .background(Color("Secondary")) // Use your secondary color here for the card background
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}
