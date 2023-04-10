//
//  ContentView.swift
//  Hinge
//
//  Created by Gal Blank on 4/8/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dataRepo: PronounsRepo
    @State var switchOn = false
    var rowHeight = 40.0
    var scrollView: some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(dataRepo.selectedPronouns) { pronoun in
                        HStack {
                            PillView(pronoun: pronoun)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            didTap(pronoun: pronoun)
                        }
                    }
                }
            }
            .onChange(of: dataRepo.selectedPronouns, perform: { newValue in
                withAnimation {
                    value.scrollTo(newValue.count)
                }
            })
            .frame(height: 100)
            .transition(.move(edge: .bottom))
        }
    }

    var toggleView: some View {
        HStack {
            Toggle("Change Pronounes", isOn: $switchOn)
                .onChange(of: switchOn, perform: { newValue in
                    reloadData()
                })
                .padding()
        }
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                scrollView
                    .frame(maxWidth: geo.size.width)
                Divider()
                    .background(.black)
                    .frame(width: geo.size.width, height: 2)
                List {
                    ForEach(dataRepo.pronouns) { pronoun in
                        HStack {
                            let selected = dataRepo.selectedPronouns.first(where: { prn in
                                return prn == pronoun
                            }) != nil
                            PronounCellView(pronoun: pronoun)
                                .modifier(SelectedModifier(checked: selected))
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            didTap(pronoun: pronoun)
                        }
                        .frame(height: 50)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.automatic)
                        .listRowBackground(Color.white)
                    }
                }
                .listStyle(PlainListStyle())
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                .frame(height: ((Double(dataRepo.pronouns.count) * 50) + 200) > geo.size.height ? geo.size.height - 200 : Double(dataRepo.pronouns.count) * 50)
                Divider()
                    .background(.black)
                    .frame(width: geo.size.width, height: 2)
                toggleView
                    .frame(height: 50)
            }
            .padding()
        }
    }

    private func reloadData() {
        dataRepo.selectedPronouns.removeAll()
        dataRepo.pronouns.removeAll()
        dataRepo.reload(with: switchOn ? .group2 : .group1)
    }

    private func didTap(pronoun: Pronoun) {
        if dataRepo.selectedPronouns.first(where: { prn in
            return prn == pronoun
        }) != nil {
            let filtered = dataRepo.selectedPronouns.filter { $0 != pronoun }
            dataRepo.selectedPronouns = filtered
        } else {
            dataRepo.selectedPronouns.append(pronoun)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let repo = PronounsRepo(showDemo: true)
    static var previews: some View {
        ContentView(dataRepo: repo)
    }
}
