//
//  CardView.swift
//  AppHG
//
//  Created by Aitor Solano on 21/5/24.
//

import SwiftUI

struct CardView: View {
    var reward: Reward

    var body: some View {
        HStack {
            Image(reward.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(Color.gray.opacity(0.1))
            VStack(alignment: .leading) {
                Text(reward.title)
                    .font(.headline)
                    .lineLimit(3)
                    .padding(.bottom, 10)
                Button(action: {
                    // Acción para el botón
                }) {
                    HStack {
                        Text(reward.isUsed ? "Used" : "Redeem")
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .foregroundColor(reward.isUsed ? Color.customBackground : Color.black)
                    }
                    .frame(height: -5)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(7)
                }
                .disabled(reward.isUsed)
                .padding(.horizontal, 1)
            }
            .padding()
        }
        .frame(width: 250, height: 160)
        .background(Color.customColorCardBackground)
        .cornerRadius(10)
    }
}
