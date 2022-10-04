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
    @State private var trackObject: TrackObject? = TrackObject(track: Track(commontrackID: -1, hasLyrics: -1, trackName: "Sample", albumName: "Sample", artistName: "Sample"))
    
    // Image
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var isFullScreen = false
    
    
    // Lyrics
    @State private var showLyricSearch = false
    @State private var hasLyrics = false
    
    var body: some View {
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
                    VStack {
                        Text("Composed By")
                            .foregroundColor(.secondary)
                        Text(song.wrappedComposer)
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Year Composed")
                            .foregroundColor(.secondary)
                        Text(song.wrappedYearComposed)
                    }
                    .padding(.bottom)
                }
                .padding()
            }
            .font(.custom("Georgia", size: 16))
            
            Spacer()
            
            Divider()
            
            // Image picker goes here
            Button("Add Lead Sheet") {
                showingImagePicker = true
            }
            
            // MARK: - Need to be able to save image to Song Object when selected and replace when changed.
            // MARK: - Need option to use camera
            
            image?
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    isFullScreen = true
                }
            
            Divider()
            
            Button("Find Lyrics") {
                showLyricSearch = true
            }
            .buttonStyle(.bordered)
            .padding()
            Text(song.wrappedLyrics)
        }
        .padding()
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .sheet(isPresented: $showLyricSearch) {
            if hasLyrics {
                LyricsView(song: trackObject)
            } else {
                SongLyricSearchView()
            }
        }
        .fullScreenCover(isPresented: $isFullScreen, onDismiss: setFullScreenToFalse) {
            NavigationView {
                VStack {
                    HStack{
                        Spacer()
                        Button("Done") {
                            dismiss()
                            // MARK: - If picture is reloaded again, done button does not dismiss.
                        }
                        .font(.headline)
                        .padding(.trailing)
                    }
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func setFullScreenToFalse() {
        isFullScreen = false
    }
    
}

//struct SongDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongDetailView(song: Song(context: moc))
//    }
//}
