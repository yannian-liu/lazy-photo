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
    @Published var originalImage: UIImage?
    @Published var replacementImage: UIImage?

    lazy var addOriginalButtonConfiguration: StatableButtonViewConfiguration = .init(
        content: Text("add_original_photo".localized),
        activeDisplay: .primaryButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil) { [unowned self] in
            isOriginalImagePickerPresented = true
    }
    
    lazy var addReplacementButtonConfiguration: StatableButtonViewConfiguration = .init(
        content: Text("add_replacement_photo".localized),
        activeDisplay: .primaryButton,
        disabledDisplay: nil,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: nil) { [unowned self] in
            isReplacementImagePickerPresented = true
    }

    lazy var generateButtonConfiguration: StatableButtonViewConfiguration = .init(
        content: Text("generate".localized),
        activeDisplay: .primaryButton,
        disabledDisplay: .primaryButtonDisabled,
        highlightedDisplay: nil,
        animation: .scale,
        statePublisher: Publishers.CombineLatest(
            $originalImage.eraseToAnyPublisher(),
            $replacementImage.eraseToAnyPublisher()
        )
        .map { original, replacement in
            (original != nil && replacement != nil) ? .active : .disabled
        }
        .eraseToAnyPublisher())
    { [unowned self] in
            generate()
    }
    
    func generate() {
        
    }
}
