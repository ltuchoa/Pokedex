//
//  DataExtension.swift
//  DataExtension
//
//  Created by Larissa Uchoa on 08/08/21.
//

import SwiftUI

extension Data {
    func removeNullsFrom(string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
