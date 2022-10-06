//
//  SongInfoEditorView.swift
//  TuneList
//
//  Created by Marc-Developer on 9/9/22.
//

// Textfield needs to bind to an @State property. @State properties cannot be initialized in init() -- error: Variable 'self.title' used before being initialized --.


import SwiftUI

struct AddEditSongView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var key: String = "C Major"
    @State private var style: String = ""
    
    @State private var composer: String = ""
    @State private var yearComposed: String = ""

    // Images
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var isFullScreen = false
    
    let navTitle: String
    let song: Song?
    let keys = Keys()
    let isNewSong: Bool
    var leadSheet: Data?
    
    init(song: Song?, isNewSong: Bool) {
        self.song = song
        self.isNewSong = isNewSong
        self.navTitle = (song != nil) == true ? "Edit Song" : "Add New Song"
        self.leadSheet = song?.leadSheet
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    TextField("Song Title", text: $title)
                    
                    KeyPicker()

                    TextField("Style", text: $style)
                    
                } header: {
                    Text("Quick Reference Info")
                }
                
                Section {
                    TextField("Composer", text: $composer)
                    TextField("Date Composed", text: $yearComposed)
                    Button("Add Entry") {
                        // AddEntryView()
                    }
                    
                    // MARK: - Need to be able to save image to Song Object when selected and replace when changed.
                    // MARK: - Need option to use camera
                } header: {
                    Text("More Info")
                }
                
                Section {
                    // Image picker goes here
                    Button("Select Lead Sheet") {
                        showingImagePicker = true
                    }
                    
                    image?
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            isFullScreen = true
                        }
                    
                } header: {
                    Text("Lead Sheet")
                }
                
            }
            .onAppear {
                title = song?.title ?? ""
                key = song?.key ?? "C Major"
                style = song?.style ?? ""
                composer = song?.composer ?? ""
                yearComposed = song?.yearComposed ?? ""
            }
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .navigationTitle(navTitle)
            .toolbar {
                Button("Save") {
                    saveSong()
                    dismiss()
                }
                // MARK: - BUG If I go to add view, type something in title, delete it, dismiss sheet, nothing works on the view before.
                
                .disabled(saveButtonDisabled())
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
        print(inputImage)
        image = Image(uiImage: inputImage)
    }
    
    func setFullScreenToFalse() {
        isFullScreen = false
    }
    
    @ViewBuilder
    func KeyPicker() -> some View {
        Picker("Key", selection: $key) {
            Section {
                ForEach(keys.majorKeys, id: \.self) {
                    Text($0)
                }
            } header: {
                Text("Major keys")
            }
            
            Section {
                ForEach(keys.minorKeys, id: \.self) {
                    Text($0)
                }
            } header: {
                Text("minor keys")
            }
        }
    }
    
    func saveButtonDisabled() -> Bool {
        if title.isEmpty || style.isEmpty {
            return true
        }
        return false
        }
    
    func saveSong() {
        if isNewSong {
            let newSong = Song(context: moc)
            newSong.id = UUID()
            newSong.title = title
            newSong.key = key
            newSong.style = style
            newSong.composer = composer
            newSong.yearComposed = yearComposed
            
            // Save Image (Core Data Binary Data Type)
            newSong.leadSheet = inputImage?.jpegData(compressionQuality: 1.0)
            
        } else {
            song?.title = title
            song?.key = key
            song?.style = style
            song?.composer = composer
            song?.yearComposed = yearComposed
//            song?.leadSheet = leadSheet
        }
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
}

//struct AddEditSongView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSongView()
//    }
//}
