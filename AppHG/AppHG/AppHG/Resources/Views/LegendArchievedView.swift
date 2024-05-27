//
//  LegendArchievedView.swift
//  AppHG
//
//  Created by Aitor Solano on 21/5/24.
//

import SwiftUI

struct LegendAchievedView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToBenefits = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("hgBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .padding()
                    Spacer()
                    
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.black)
                        Text("Legend")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 12)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.customColorGreenLabel)
                    .cornerRadius(6)
                    
                    Text("LEGEND \nACHIEVED.")
                        .font(.largeTitle)
                        .font(.system(size: 50))
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)

                    HStack(spacing: 5) {
                        ForEach(0..<4) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                        }
                    }

                    Text("You're eating Honest Greens morning, \nevening, and night. You're legendary.")
                        .font(.body)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(.horizontal)
                    
                    NavigationLink(destination: BenefitsView(), isActive: $navigateToBenefits) {
                        Button(action: {
                            self.navigateToBenefits = true
                        }) {
                            Text("Ver beneficios")
                                .font(.callout)
                                .fontWeight(.bold)
                                .padding()
                                .frame(width: 200, height: 60)
                                .background(Color.white)
                                .foregroundColor(Color.brown)
                                .cornerRadius(30)
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .padding(.bottom, -180.0)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LegendAchievedView_Previews: PreviewProvider {
    static var previews: some View {
        LegendAchievedView()
    }
}
