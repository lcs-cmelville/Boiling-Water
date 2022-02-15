//
//  ContentView.swift
//  Boiling Water
//
//  Created by Claire Coding Account on 2022-02-15.
//

import SwiftUI

struct ContentView: View {
    
    @State var boilingWater = 100.0
    
    var atmosphericPressure: Double {
        return 5 * boilingWater - 400
    }
    
    var feedback: String {
        switch boilingWater {
            case 80...99:
                return "Above sea level"
            case 100:
                return "At sea level"
            default:
                return "Below sea level"
        }
    }

    
    var body: some View {
        VStack{
            
        Slider(value: $boilingWater,
               in: 80.0...200.0,
               step: 1.0,
               label: {
            Text("Tempurature at which the water boils")
            },
               minimumValueLabel: {
            Text("80 °C")
            },
               maximumValueLabel: {
            Text("200 °C")
            })
                .padding(.vertical)
            
            Text("\(String(format: "%.1f", boilingWater)) °C")
                .bold()
                .padding()
            
            Text("\(String(format: "%.1f", atmosphericPressure)) kPa ")
                .bold()
                .padding()
            
            Spacer()
            
            Text(feedback)
                .bold()
                .padding()
                .font(.title2)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Boiling Water")        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ContentView()
        }
    }
}
