//
//  ContentView.swift
//  FirstTestMacOsApp
//
//  Created by Jonathan Gusse on 22/10/2024.
//

import SwiftUI
import AVKit



struct Option: Hashable {
    let title: String
    let imageName: String
}




struct ContentView: View {
    
    let options: [Option] = [
        .init(title: "Home", imageName: "house"),
        .init(title: "About", imageName: "info.circle"),
        .init(title: "Setting", imageName: "gear"),
        .init(title: "Social", imageName: "message"),
        ]
    
    var body: some View {
        
        NavigationView {
            
            ListView(options: options)
            
            MainView()
            
        }//END NavigationView
        
    }//END body: some.. ....
}//END struct... ......


struct ListView: View {
    let options: [Option]
    
    var body: some View {
        VStack {
            ForEach(options, id: \.self) { option in
                HStack {
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 15)
                    
                    Text(option.title)
                    
                    Spacer()
                }//END HStack.. ...
                .padding(.top, 10)
                .padding(.leading, 10)
                
            }//END ForEach.. ...
            
            Spacer()
            
        }//END Vstack.. ...
        
        
        
    }//END body: some.. ....
}//END struct... ......


struct MainView: View {
    
    let cols: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    let videos = Array(1...6).map { "Video\($0)" } // Vidéos nommées "video1", "video2", etc.
    
    var body: some View {
        VStack {
            Image("header")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            LazyVGrid(columns: cols) {
                ForEach(videos, id: \.self) { video in
                    if let videoURL = Bundle.main.url(forResource: video, withExtension: "mov") {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(height: 100)
                    } else {
                        Text("Vidéo introuvable")
                            .frame(height: 100)
                    }
                    
                }//END ForEach
                
            }//END LazyVgrid.. ......
            
        }//END VStack.. ......
        
    }//END body: some.. ....
}//END struct... ......





#Preview {
    ContentView()
}
