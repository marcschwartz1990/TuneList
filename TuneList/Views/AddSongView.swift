//
//  AddSongView.swift
//  TuneList
//
//  Created by Marc-Developer on 10/13/22.
//

import SwiftUI

struct AddSongView: View {
    @Environment(\.managedObjectContext) var moc
    
    @Binding var isPresented: Bool
    
    @State private var title: String = ""
    @State private var key: String = "C Major"
    @State private var style: String = ""
    
    @State private var composer: String = ""
    @State private var lyricist: String = ""
    @State private var yearComposed: String = ""
    @State private var form: String = ""
    @State private var notes: String = ""
    
    let keys = Keys()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    QuickReferenceSection()
                    MoreSongInfoSection()
                }
                SaveButton(isPresented: $isPresented) {
                    saveSong()
                }
                .disabled(saveButtonDisabled())
            }
            .navigationTitle("Add New Song")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "x.circle.fill")
                    }
                }
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
    
    func saveSong() {
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
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
}
