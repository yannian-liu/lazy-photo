//
//  Plate+Extension.swift
//  lazy-photo-ios
//
//  Created by Yannian Liu on 22/12/2024.
//

import UIToolbox

extension PlateDisplay {
    static var primary: Self {
        .init(sizeStyle: .paddingDefaultWithInfiniteWidth, color: .white, shape: .rectangle(cornerRadius: 10), border: .primary)
    }
}

