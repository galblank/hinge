//
//  PronounCellView.swift
//  Hinge
//
//  Created by Gal Blank on 4/8/23.
//

import SwiftUI

struct SelectedModifier: ViewModifier {
    var checked: Bool = false
    func body(content: Content) -> some View {
        Group {
                    content
                    Circle()
                        .frame(height: 30)
                        .padding()
                        .foregroundColor(checked ? .gray : .black)
                }

        }
}

struct PronounCellView: View {
    @State var pronoun: Pronoun

    var body: some View {
        HStack {
            Text(pronoun.title)
                .font(.headline)
                .padding()
            Spacer()

        }
    }
}

struct PronounCellView_Previews: PreviewProvider {
    static let pronoun = Pronoun(id: 1, isSingular: false, tense: .possessiveAdjective, title: "Them")
    static var previews: some View {
        PronounCellView(pronoun: pronoun)
    }
}
