//
//  ManyView.swift
//  OneToManyTest
//
//  Created by Tony Miller on 3/26/20.
//  Copyright © 2020 Fahrsoft. All rights reserved.
//

import SwiftUI

struct ManyView: View {
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var many: Many
    var body: some View {
        VStack {
            Text("Attribute: \(self.many.wrappedAttribute)")
        }
    }
}

//struct ManyView_Previews: PreviewProvider {
//    static var previews: some View {
//        ManyView()
//    }
//}
