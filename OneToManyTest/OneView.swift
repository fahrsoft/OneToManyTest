//
//  OneView.swift
//  OneToManyTest
//
//  Created by Tony Miller on 3/26/20.
//  Copyright © 2020 Fahrsoft. All rights reserved.
//

import SwiftUI

struct OneView: View {
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject var one: One
    
    var body: some View {
        VStack {
            Text("Name: \(self.one.wrappedName)")
        }
    }
}

//struct OneView_Previews: PreviewProvider {
//    static var previews: some View {
//        OneView()
//    }
//}
