//
//  ContentView.swift
//  AppHG
//
//  Created by Aitor Solano on 21/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    @State private var showingSheet = false

    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .topLeading) {
                VStack(spacing: 0) {
                    Color(red: 0.6, green: 0.3, blue: 0.2)
                        .frame(height: 200)
                        .zIndex(1)
                    Spacer()
                }
                HStack {
                    Button(action: {
                        // Acción para el botón back
                    }) {
                        Image("backButton")
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.leading, 6)
                VStack (spacing: -1330){
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("YOU'RE A LEGEND.")
                                .font(.title3)
                                .fontWeight(.heavy)
                            Button(action: {
                                self.showingSheet.toggle()
                            }){
                                HStack (spacing: 4){
                                    Text("Know")
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.white)
                                    Image(systemName: "plus")
                                        .font(.system(size: 10))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.white)
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color.black)
                                .cornerRadius(5)
                            }
                            .offset(x: 40)
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.top)
                        .sheet(isPresented: $showingSheet) {
                            LegendAchievedView()
                        }
                        Text("Get 65 green stamps more before \(self.viewModel.nextYearDate.formatted(as: "dd/MM/yyyy")) to keep your level, Legend.")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.bottom)
                            .fixedSize(horizontal: false, vertical: true)
                        HStack {
                            Text("\(Int(self.viewModel.progress * 100)) of 100 Green stamps")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                                .padding(.all, 12.0)
                                .frame(height: 30.0)
                                .background(Color.green.opacity(0.09))
                                .cornerRadius(5)
                            Spacer()
                        }
                        HStack(spacing: -10) {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 17, height: 17)
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.customColorGray)
                                    .frame(height: 7)
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.green)
                                    .frame(width: CGFloat(viewModel.progress) * 312, height: 7)
                            }
                            .frame(width: 312, height: 10)
                            Circle()
                                .fill(viewModel.progress >= 1.0 ? Color.green : Color.customColorGray)
                                .frame(width: 17, height: 17)
                        }
                        .onTapGesture {
                            withAnimation {
                                if self.viewModel.progress < 1.0 {
                                    self.viewModel.progress += 0.1
                                }
                            }
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Legend 2024")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text("\(Date().formatted(as: "dd/MM/yyyy"))")
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                                    .padding(.leading, 10)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("Legend 2025")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text("\(self.viewModel.nextYearDate.formatted(as: "dd/MM/yyyy"))")
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                                    .padding(.trailing, 10)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        Text("REWARDS.")
                            .font(.title3)
                            .fontWeight(.heavy)
                            .padding(.top)
                        Text("These are your monthly rewards.")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.bottom)
                            .fixedSize(horizontal: false, vertical: true)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel.rewards, id: \.title) { reward in
                                    CardView(reward: reward)
                                }
                            }
                            .padding()
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(15)
                    .shadow(radius: 0)
                    .padding(.horizontal)
                    ZStack(alignment:.top) {
                        VStack {
                            ZStack {
                                ZStack (){
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
                                    .offset(x: 90)
                                    Image("watermelon")
                                        .resizable()
                                        .frame(width: 80, height: 100)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                        .shadow(radius: 3)
                                }
                                .offset(y: -40)
                                .zIndex(2)
                                VStack (spacing: 20){
                                    Text(viewModel.user.name)
                                        .font(.title3)
                                        .fontWeight(.heavy)
                                        .offset(y: 30)
                                    HStack {
                                        Image(systemName: "gift")
                                            .fontWeight(.bold)
                                        Text("\(viewModel.user.balance, specifier: "%.2f") €")
                                            .fontWeight(.bold)
                                        Text("• Joined Sep 2023")
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .offset(y: 27)
                                    HStack {
                                        Button(action: {
                                            // Acción para el botón
                                        }) {
                                            HStack {
                                                Image(systemName: "hands.clap")
                                                    .foregroundColor(Color.black)
                                                Text("I have a code")
                                                    .font(.system(size: 13))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(Color.black)
                                            }
                                            .frame(height: -45)
                                            .padding()
                                            .background(Color.white)
                                            .cornerRadius(7)
                                        }
                                        .padding(.horizontal, 10)
                                        Button(action: {
                                            // Acción para el botón de historial
                                        }) {
                                            HStack {
                                                Image(systemName: "doc.text")
                                                    .foregroundColor(Color.black)
                                                Text("History")
                                                    .font(.system(size: 13))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(Color.black)
                                            }
                                            .frame(height: -45)
                                            .padding()
                                            .background(Color.white)
                                            .cornerRadius(7)
                                        }
                                        .padding(.horizontal, 10)
                                    }
                                    .frame(width: 330, height: 25)
                                    .padding(.top, 30.0)
                                }
                                .padding()
                                .background(Color.customBackground)
                                .cornerRadius(15)
                                .padding(.top, 100.0)
                            }
                            .offset(y: 20)
                        }
                    }
                    .frame(height: 1320.0)
                }
                .padding(.top)
            }
            .background(Color(UIColor.secondarySystemBackground))
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
