//
//  ContentView.swift
//  HabitTracking
//
//  Created by Vitali Martsinovich on 2023-08-17.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.activities) { activity in
                    NavigationLink {
                        ActivityView(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.title)
                            Spacer()
                            
                            Text(String(activity.completionCount))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .clipShape(Capsule())
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Habito").font(.title).bold()
                            .foregroundColor(Color("mainBlue"))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addingNewActivity.toggle()
                    } label: {
                        Label("Add new activity", systemImage: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $addingNewActivity) {
            AddActivity(data: data)
        }
    }
    
    //MARK: - Methods
    
    func delete(at offsets: IndexSet) {
        data.activities.remove(atOffsets: offsets)
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            return .red
        } else if activity.completionCount < 10 {
            return .orange
        } else if activity.completionCount < 20 {
            return .green
        } else if activity.completionCount < 50 {
            return .blue
        } else {
            return .indigo
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
