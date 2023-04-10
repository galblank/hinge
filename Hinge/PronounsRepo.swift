//
//  PronounsRepo.swift
//  Hinge
//
//  Created by Gal Blank on 4/8/23.
//

import Foundation

class PronounsRepo: ObservableObject {
    @Published var pronouns = [Pronoun]()
    @Published var selectedPronouns = [Pronoun]()
    init(showDemo: Bool = false, defaultData: PronounGroup = .group1) {
        if showDemo {
            pronouns = Pronoun.testGroup1
            selectedPronouns = Pronoun.testGroup2
            return
        }
        reload(with: defaultData)
    }

    func reload(with testGroup: PronounGroup) {
        switch testGroup {
        case .group1:
            pronouns = Pronoun.testGroup1
        case .group2:
            pronouns = Pronoun.testGroup2
        }
    }
}
