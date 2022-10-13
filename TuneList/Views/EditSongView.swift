//
//  EditSongView.swift
//  TuneList
//
//  Created by Marc-Developer on 10/13/22.
//

import SwiftUI

struct EditSongView: View {
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var song: Song
    
    @Binding var isPresented: Bool
    
    @State private var title: String
    @State private var key: String
    @State private var style: String
    
    @State private var composer: String
    @State private var lyricist: String
    @State private var yearComposed: String
    @State private var form: String
    @State private var notes: String
    
    let keys = Keys()
    
    init(song: Song, isPresented: Binding<Bool>) {
        self.song = song
        title = song.title ?? ""
        key = song.key ?? "C Major"
        style = song.style ?? ""
        
        composer = song.composer ?? ""
        lyricist = song.lyricist ?? ""
        yearComposed = song.yearComposed ?? ""
        form = song.form ?? ""
        notes = song.notes ?? ""
        
        self._isPresented = isPresented
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                QuickReferenceSection()
                MoreSongInfoSection()
            }
            .navigationTitle("Add New Song")
            .toolbar {
                Button("Save") {
                    updateSong()
                    isPresented = false
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
        .pickerStyle(.menu)
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
    
    func updateSong() {
        song.title = title
        song.key = key
        song.style = style
        song.composer = composer
        song.yearComposed = yearComposed
        song.lyricist = lyricist
        song.form = form
        song.notes = notes
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
}

//struct EditSongView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditSongView()
//    }
//}
