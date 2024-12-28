//
//  FaceReplaceViewModel.swift
//  lazy-photo-ios
//
//  Created by Yannian Liu on 22/12/2024.
//

import Combine
import Foundation
import UIToolbox
import SwiftUI

class FaceReplaceViewModel: ObservableObject {
    @Published var isOriginalImagePickerPresented = false
    @Published var isReplacementImagePickerPresented = false

    lazy var addOriginalButtonConfiguration: StatableButtonViewConfiguration = .init(
        content: Text("Add original photo"),
        activeDisplay: .primaryButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil) { [unowned self] in
            isOriginalImagePickerPresented = true
    }
    
    lazy var addReplacementButtonConfiguration: StatableButtonViewConfiguration = .init(
        content: Text("Add replacement photo"),
        activeDisplay: .primaryButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil) { [unowned self] in
            isReplacementImagePickerPresented = true
    }

}
