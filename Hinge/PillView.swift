//
//  PillView.swift
//  Hinge
//
//  Created by Gal Blank on 4/8/23.
//

import SwiftUI


struct PillView: View {
    let pronoun: Pronoun
    var body: some View {
        HStack {
            Text(pronoun.title)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                .font(.headline)
            Text("x")
                .padding(.trailing, 15)
        }
        .foregroundColor(.white)
        .background(Color.black)
        .cornerRadius(25)
    }
}

struct PillView_Previews: PreviewProvider {
    static let pronoun = Pronoun(id: 1, isSingular: false, tense: .possessiveAdjective, title: "Them")
    static var previews: some View {
        PillView(pronoun: pronoun)
    }
}
