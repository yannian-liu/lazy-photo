//
//  ButtonDisplay+Extension.swift
//  lazy-photo-ios
//
//  Created by Yannian Liu on 22/12/2024.
//

import UIToolbox
import SwiftUI

extension StatableButtonViewConfiguration<Text>.Display {
    static var primaryButton: Self {
        .init(
            contentDisplay: .init(font: .headline, color: .primaryRevert, multilineTextAlignment: .center),
            plateDisplay: .primaryButton)
    }
    
    static var primaryButtonDisabled: Self {
        .init(
            contentDisplay: .init(font: .headline, color: .primaryRevert.opacity(0.5), multilineTextAlignment: .center),
            plateDisplay: .primaryButtonDisabled)
    }
}
