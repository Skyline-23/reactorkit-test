//
//  Preview.swift
//  reactorkit-test
//
//  Created by 김부성 on 2021/07/25.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController(reactor: ViewControllerReactor()).showPreview(.iPhone12Pro)
    }
}

#endif
