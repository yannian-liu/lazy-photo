//
//  Plate+Extension.swift
//  lazy-photo-ios
//
//  Created by Yannian Liu on 22/12/2024.
//

import UIToolbox

extension PlateDisplay {
    static var card: Self {
        .init(sizeStyle: .padding(edgeInsets: .init(top: 5, leading: 5, bottom: 5, trailing: 5)), color: .clear, shape: .rectangle(cornerRadius: 0), border: .primary)
    }
    
    static var primaryButton: Self {
        .init(sizeStyle: .padding(edgeInsets: .init(top: 10, leading: 15, bottom: 10, trailing: 15)), color: .primary, shape: .capsule, border: nil)

    }
}

