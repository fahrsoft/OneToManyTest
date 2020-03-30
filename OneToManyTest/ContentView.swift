//
//  ContentView.swift
//  OneToManyTest
//
//  Created by Tony Miller on 3/26/20.
//  Copyright © 2020 Fahrsoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: One.entity(), sortDescriptors: []) var ones: FetchedResults<One>
    
    @State private var newName = ""
    @State var isNavTitleHidden = true
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New One", text: self.$newName)
                    Spacer()
                    Button(action: {
                        let newOne = One(context: self.moc)
                        newOne.name = self.newName
                        self.newName = ""
                        try? self.moc.save()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                            .frame(width: 32, height: 32, alignment: .center)
                    }
                }
                .padding(.top)
                .padding(.horizontal)

                List {
                    Section(header: Text("Ones")) {
                        ForEach(self.ones, id:\.self) { (one:One) in
                            NavigationLink(destination: OneDetailView(one: one, isNavTitleHidden: self.$isNavTitleHidden).environment(\.managedObjectContext, self.moc)) {
                                OneView(one: one).environment(\.managedObjectContext, self.moc)
                            }
                        }
                            
                        .onDelete { indexSet in
                            let deleteOne = self.ones[indexSet.first!]
                            self.moc.delete(deleteOne)
                            do {
                                try self.moc.save()
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Ones List"))
            .navigationBarHidden(self.isNavTitleHidden)
            .onAppear {
                self.isNavTitleHidden = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PreviewManagedObjectContext.shared.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
