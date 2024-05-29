//
//  RankView.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 24/05/24.
//

import SwiftUI

struct RankView: View {
    var body: some View {
        VStack {
            RankRecruit()
            RankNoob()
            RankTactical()
            RankSpecial()
            RankMaster()
        }
    }

}

#Preview {
    RankView()
}
