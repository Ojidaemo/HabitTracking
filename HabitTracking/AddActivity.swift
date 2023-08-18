//
//  AddActivity.swift
//  HabitTracking
//
//  Created by Vitali Martsinovich on 2023-08-18.
//

import SwiftUI

struct AddActivity: View {
    
    @ObservedObject var data: Activities
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Add Activity").font(.title).bold()
                            .foregroundColor(Color("mainBlue"))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                        guard trimmedTitle.isEmpty == false else { return }
                        
                        let activity = Activity(title: trimmedTitle, description: description)
                        data.activities.append(activity)
                        dismiss()
                    }
                }
            }
        }
    }
    
    
    struct AddActivity_Previews: PreviewProvider {
        static var previews: some View {
            AddActivity(data: Activities())
        }
    }
}
