//
//  MVIContainer.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/23/24.
//

import Foundation
import SwiftUI
import Combine

/*
 *  MVIContainer
 *
 *  Discussion:
 *      A container for the Intent and ViewModel for reusability.
 *
 */

final class MVIContainer<Intent, Model>: ObservableObject {


    let intent: Intent
    let model: Model


    private var cancellable: Set<AnyCancellable> = []


    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model
        
        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}
