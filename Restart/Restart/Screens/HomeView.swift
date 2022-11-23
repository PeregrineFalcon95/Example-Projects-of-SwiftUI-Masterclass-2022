//
//  HomeView.swift
//  Restart
//
//  Created by on 19/10/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("Onboarding") var isOnboardingViewActive : Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack (spacing: 20){
            //Header
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                        ,
                        value: isAnimating
                    )
            }
            
            //Center
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //Footer
            
            Spacer()
            
            Button(action: {
                withAnimation(Animation.easeOut(duration: 1.0)){
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //:Vstack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                isAnimating = true
            } )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
