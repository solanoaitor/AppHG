//
//  BenefitsView.swift
//  AppHG
//
//  Created by Aitor Solano on 21/5/24.
//

import SwiftUI

struct BenefitsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ZStack {
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
                   VStack(spacing: 4) {
                       Text("HONEST")
                           .font(.largeTitle)
                           .fontWeight(.black)
                       Text("PEOPLE.")
                           .font(.largeTitle)
                           .fontWeight(.black)
                   }
                   .multilineTextAlignment(.center)
               }
               .padding(.top, 50)
               .padding(.horizontal)
                
                Text("YOU HAVE XX GREEN STAMPS - VALID UNTIL 17/09/2023")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                BenefitCardView(title: "STARTER.",
                                subtitle: "20-20 GREEN STAMPS COLLECTED",
                                benefits: ["Greens challenge: buy 10 garden bowls or market plates and get one free.",
                                           "Refer a friend and get 3€ when they order for the first time using our App."],
                                badge: "Starter")
                
                BenefitCardView(title: "CHAMP.",
                                subtitle: "50-50 GREEN STAMPS COLLECTED",
                                benefits: ["Greens challenge: buy 10 garden bowls or market plates and get one free.",
                                           "Refer a friend and get 4€ when they order for the first time using our App.",
                                           "5€ credit on your birthday week.",
                                           "One free sweet corner item of the month."],
                                badge: "Champ")
                
                BenefitCardView(title: "STAR.",
                                subtitle: "UNLOCKS AT 50 GREEN STAMPS",
                                benefits: ["Greens challenge: buy 10 garden bowls or market plates and get one free.",
                                           "Refer a friend and get 6€ when they order for the first time using our App.",
                                           "10€ credit on your birthday week.",
                                           "One free sweet corner item of the month.",
                                           "1 chance to win one invitation to our restaurant opening parties.",
                                           "1 chance to win an invitation to our yearly masterclass with chef Ben.",
                                           "1 chance to win an invitation to our bimonthly wellness exclusive events."],
                                badge: "Star")
                
                BenefitCardView(title: "LEGEND.",
                                subtitle: "100+ GREEN STAMPS COLLECTED",
                                benefits: ["Greens challenge: buy 10 garden bowls or market plates and get one free.",
                                           "Refer a friend and get 9€ when they order for the first time using our App.",
                                           "15€ credit on your birthday week.",
                                           "One free sweet corner item of the month.",
                                           "2 chances to win one invitation to our restaurant opening parties.",
                                           "2 chances to win an invitation to our yearly masterclass with chef Ben.",
                                           "2 chances to win an invitation to our bimonthly wellness exclusive events."],
                                badge: "Your tier")

                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                    VStack {
                        HStack {
                            Text("Your green stamps expire on")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Text("01/06/2023.")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Your green stamps resets on")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Text("01/01/2024.")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
        .background(Color(UIColor.secondarySystemBackground))
        .navigationBarHidden(true) 
        .edgesIgnoringSafeArea(.all)
    }
}

struct BenefitCardView: View {
    var title: String
    var subtitle: String
    var benefits: [String]
    var badge: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "lock.open")
                        .foregroundColor(.gray)
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.black)
                            .multilineTextAlignment(.leading)
                        Text(subtitle)
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                }
                ForEach(benefits, id: \.self) { benefit in
                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                        Text(benefit)
                            .font(.callout)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
            
            // Badge
            HStack {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.black)
                Text(badge)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(6)
            .background(Color.customColorGreenLabel)
            .cornerRadius(6)
            .offset(x: -40, y: -15)
        }
    }
}


struct BenefitsView_Previews: PreviewProvider {
    static var previews: some View {
        BenefitsView()
    }
}

