//
//  OneDetailView.swift
//  OneToManyTest
//
//  Created by Tony Miller on 3/26/20.
//  Copyright © 2020 Fahrsoft. All rights reserved.
//

import SwiftUI

struct OneDetailView: View {
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var one: One
    
    @State private var newManyAttribute = ""
    @Binding var isNavTitleHidden: Bool
    
    @FetchRequest var manys: FetchedResults<Many>
    
    init(one: One, isNavTitleHidden: Binding<Bool>) {
        self.one = one
        self._isNavTitleHidden = isNavTitleHidden
        var predicate: NSPredicate?
        predicate = NSPredicate(format: "one = %@", one)
        self._manys = FetchRequest(
            entity: Many.entity(),
            sortDescriptors: [],
            predicate: predicate
        )
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("New Many", text: self.$newManyAttribute)
                Spacer()
                Button(action: {
                    let newMany = Many(context: self.moc)
                    newMany.attribute = self.newManyAttribute
                    self.newManyAttribute = ""
                    self.one.addToMany(newMany)
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
                Section(header: Text("Manys")) {
//                    ForEach(self.one.manyArray, id: \.self) { many in
//                        ManyView(many: many).environment(\.managedObjectContext, self.moc)
//                    }
                    ForEach(self.manys, id: \.self) { many in
                        ManyView(many: many).environment(\.managedObjectContext, self.moc)
                    }
                }
            }
        }
        .navigationBarTitle("\(self.one.wrappedName) Details")
        .onAppear {
            self.isNavTitleHidden = false
        }
    }
}

//
//struct OneDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = PreviewManagedObjectContext.shared.viewContext
//        let sampleOne = PreviewManagedObjectContext.shared.sampleOne
//        return OneDetailView(one: sampleOne, isNavTitleHidden: .constant(false)).environment(\.managedObjectContext, context)
//    }
//}
