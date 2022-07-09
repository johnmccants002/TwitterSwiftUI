//
//  LazyView.swift
//  TwitterSwiftUI
//
//  Created by John McCants on 7/8/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}

