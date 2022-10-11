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
    @State private var lyricist: String = ""
    @State private var yearComposed: String = ""
    @State private var form: String = ""
    @State private var notes: String = ""
    
    let navTitle: String
    let song: Song?
    let keys = Keys()
    let isNewSong: Bool
    
    init(song: Song?, isNewSong: Bool) {
        self.song = song
        self.isNewSong = isNewSong
        self.navTitle = (song != nil) == true ? "Edit Song" : "Add New Song"
    }
    
    var body: some View {
        NavigationView {
            Form {
                QuickReferenceSection()
                MoreSongInfoSection()
            }
            .onAppear {
                title = song?.title ?? ""
                key = song?.key ?? "C Major"
                style = song?.style ?? ""
                composer = song?.composer ?? ""
                yearComposed = song?.yearComposed ?? ""
                lyricist = song?.lyricist ?? ""
                form = song?.form ?? ""
                notes = song?.notes ?? ""
            }
            .navigationTitle(navTitle)
            .toolbar {
                Button("Save") {
                    saveSong()
                    dismiss()
                }
                
                .disabled(saveButtonDisabled())
            }
        }
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
    
    @ViewBuilder
    func QuickReferenceSection() -> some View {
        Section {
            TextField("Song Title", text: $title)
            KeyPicker()
            TextField("Style", text: $style)
        } header: {
            Text("Quick Reference Info")
        }
    }
    
    @ViewBuilder
    func MoreSongInfoSection() -> some View {
        Section {
            TextField("Form", text: $form)
            TextField("Composer", text: $composer)
            TextField("Lyricist", text: $lyricist)
            TextField("Date Composed", text: $yearComposed)
        } header: {
            Text("More Info")
        }
        
        Section {
            ZStack(alignment: .leading) {
                if notes.isEmpty {
                    Text(" Write a description...")
                        .foregroundColor(.secondary.opacity(0.5))
                }
                
                TextEditor(text: $notes)
            }
        } header: {
            Text("Description")
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
            newSong.lyricist = lyricist
            newSong.form = form
            newSong.notes = notes
            
        } else {
            song?.title = title
            song?.key = key
            song?.style = style
            song?.composer = composer
            song?.yearComposed = yearComposed
            song?.lyricist = lyricist
            song?.form = form
            song?.notes = notes
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
