//
//  SharedItem.swift
//  zts portfolio
//
//  Created by Hubert Leszkiewicz on 17/11/2021.
//

import Foundation

struct SharedItem: Identifiable {
    let id: String // swiftlint:disable:this identifier_name
    let title: String
    let detail: String
    let complete: Bool
}
