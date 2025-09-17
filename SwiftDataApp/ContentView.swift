//
//  ContentView.swift
//  SwiftDataApp
//
//  Created by Arman on 16/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destination: [Destination]
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: $path){
            List{
                ForEach(destination) { destination in
                    NavigationLink(value: destination) {
                        VStack(alignment: .leading) {
                            Text(destination.name)
                                .font(.headline)
                            Text(destination.date.formatted(date: .long, time: .shortened))
                            
                        }
                    }
                    
                    
                }
                .onDelete(perform: deleteDestination)
            }
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar{
                Button("Add Samples", action: addSamples)
                Button("Add Destination", systemImage: "plus", action: addDestination)
            }
        }
    }
    func addSamples(){
        let rome = Destination(name: "Rome")
        let florance = Destination(name: "Florance")
        let naples = Destination(name: "Naples")
        
        modelContext.insert(rome)
        modelContext.insert(florance)
        modelContext.insert(naples)
    }
    
    func addDestination(){
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    
    func deleteDestination(_ indexSet: IndexSet){
        for index in indexSet {
            let destination = destination[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    ContentView()
}
