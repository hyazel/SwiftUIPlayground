//
//  UpdateStore.swift
//  SwiftUIPlayground
//
//  Created by Laurent Catalina on 09/07/2019.
//  Copyright © 2019 Laurent Droguet. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: BindableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    var updates: [Update] {
        didSet {
            didChange.send()
        }
    }
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}
