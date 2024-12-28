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

    lazy var originalButtonConfiguration: StatableButtonViewConfiguration = .init(
        content: Text("Add original photo"),
        activeDisplay: .primaryButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil) { [unowned self] in
            isOriginalImagePickerPresented = true
        }
        
}
