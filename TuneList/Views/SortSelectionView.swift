//
//  SortSelectionView.swift
//  TuneList
//
//  Created by Marc-Developer on 10/3/22.
//

import SwiftUI

struct SortSelectionView: View {
  @Binding var selectedSortItem: SongSort
  
  let sorts: [SongSort]
  
    var body: some View {
      Menu {
        Picker("Sort By", selection: $selectedSortItem) {
          ForEach(sorts, id: \.self) { sort in
            Text("\(sort.name)")
          }
        }
      } label: {
        Label("Sort",
              systemImage: "line.horizontal.3.decrease.circle")
      }
      .pickerStyle(.inline)
    }
}

struct SortSelectionView_Previews: PreviewProvider {
  @State static var sort = SongSort.default
  
    static var previews: some View {
        SortSelectionView(
          selectedSortItem: $sort,
          sorts: SongSort.sorts
        )
    }
}
