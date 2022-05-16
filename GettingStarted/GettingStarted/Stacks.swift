// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct WeatherView: View {
    var body: some View {
        HStack(spacing: 18) {
            Image(systemName: "sunrise.fill")
            Text("6:15 AM")
        }
        .font(.system(size: 36))
    }
}

struct WeatherViews: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 18) {
                Image(systemName: "sunrise.fill")
                Text("6:15 AM")
            }
            HStack(spacing: 18) {
                Image(systemName: "sunset.fill")
                Text("5:30 PM")
            }
        }
        .font(.system(size: 36))
    }
}

//struct WeatherViews: View {
//    var body: some View {
//        VStack(spacing: 8) {
//            Cell(imageName: "sunrise.fill", time: "6:15 AM")
//            Cell(imageName: "sunset.fill", time: "5:30 PM")
//        }
//        .font(.system(size: 36))
//    }
//}

struct FancyWeatherView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .opacity(0.3)
                .cornerRadius(25)
                .frame(maxWidth: 260, maxHeight: 300)
            VStack(spacing: 8) {
                WeatherCell(imageName: "sunrise.fill", time: "6:15 AM")
                WeatherCell(imageName: "cloud.rain.fill", time: "7:00 AM")
                WeatherCell(imageName: "cloud.sun.fill", time: "12:00 PM")
                WeatherCell(imageName: "sunset.fill", time: "7:11 PM")
            }
        }
    }
}

//struct Cell: View {
//    let imageName: String
//    let time: String
//
//    var body: some View {
//        HStack(spacing: 18) {
//            Image(systemName: imageName)
//            Text(time)
//        }
//    }
//}

struct WeatherCell: View {
    let imageName: String
    let time: String
    
    var body: some View {
        HStack(spacing: 18) {
            Group {
                Image(systemName: imageName)
                    // Multicolor system image, where applicable
                    .renderingMode(.original)
                    .frame(width: 32)
                    .padding(12.0)
                    .background(Color.blue)
                Text(time)
                    .fontWeight(.light)
                    .frame(width: 120, alignment: .leading)
                    .lineLimit(4)
            }
        }
        .font(.system(size: 20))
        .background(Color.init(white: 0.5, opacity: 0.25))
        .cornerRadius(6)
    }
}

struct Stacks_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
        WeatherViews()
        FancyWeatherView()
            
            
            
        
    }
}
