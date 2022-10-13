//
//  SongDetailView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/16/22.
//

import SwiftUI

struct SongDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    let song: Song
    var isPresented: Binding<Bool>
    
    var body: some View {
        ScrollView {
            VStack {
                Text(song.wrappedTitle)
                    .lineLimit(1)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.5)
                    .font(.custom("Georgia", size: 36))
                    .font(.largeTitle)
                    .padding([.top, .bottom])
                
                Group {
                    HStack {
                        HStack {
                            Text("Key:")
                                .foregroundColor(.secondary)
                            Text(song.wrappedKey)
                        }
                        
                        Text("|")
                        
                        HStack {
                            Text("Style:")
                                .foregroundColor(.secondary)
                            Text(song.wrappedStyle)
                        }
                    }
                    
                    Divider()
                    
                    VStack {
                        if !song.wrappedForm.isEmpty {
                            VStack {
                                Text("Form")
                                    .foregroundColor(.secondary)
                                Text(song.wrappedForm)
                            }
                            .padding(.bottom)
                        }
                        
                        if !song.wrappedComposer.isEmpty {
                            VStack {
                                Text("Composed By")
                                    .foregroundColor(.secondary)
                                Text(song.wrappedComposer)
                            }
                            .padding(.bottom)
                        }
                        
                        if !song.wrappedLyricist.isEmpty {
                            VStack {
                                Text("Lyrics By")
                                    .foregroundColor(.secondary)
                                Text(song.wrappedLyricist)
                            }
                            .padding(.bottom)
                        }
                        
                        if !song.wrappedYearComposed.isEmpty {
                            VStack {
                                Text("Year Composed")
                                    .foregroundColor(.secondary)
                                Text(song.wrappedYearComposed)
                            }
                            .padding(.bottom)
                        }
                        
                        if !song.wrappedNotes.isEmpty {
                            VStack {
                                Text("Description")
                                    .foregroundColor(.secondary)
                                ScrollView {
                                    Text(song.wrappedNotes)
                                }
                                .padding(10)
                            }
                        }
                    }
                    .padding()
                }
                .font(.custom("Georgia", size: 16))
                
                Spacer()
                

            }
            .padding()
        }
        
        Divider()
        ReturnButton(isPresented: isPresented)
    }
}

//struct SongDetailView_Previews: PreviewProvider {
//    static let dataController = DataController()
//    static var song: Song = {
//        let context = dataController.container.viewContext
//        let song = Song(context: context)
//        song.key = "C Major"
//        song.style = "Up Tempo"
//        song.title = "Little Rock Getaway"
//        return song
//    }()
//    
//    static var isPresented = true
  
    
// Check out this site for binding previews:
// https://developer.apple.com/forums/thread/118589
    
//    static var previews: some View {
//        SongDetailView(song: song, isPresented: $isPresented)
//            .environment(\.managedObjectContext, dataController.container.viewContext)
//    }
//}
