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
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add Many")) {
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
                }
                
                Section(header: Text("Manys")) {
                    ForEach(self.one.manyArray, id: \.self) { many in
                        ManyView(many: many).environment(\.managedObjectContext, self.moc)
                    }
                }
                
            }
            .navigationBarTitle(Text("\(self.one.wrappedName)"))
        }
    }
}


//struct OneDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        OneDetailView()
//    }
//}
