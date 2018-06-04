//
//  L10n.swift
//  L10n
//
//  Created by Dani Manuel on 10/3/17.
//  Copyright © 2017 Dani Manuel Céspedes Lara (dmanuelcl@gmail.com) . All rights reserved.
//

import Foundation

public extension String {
    public func localized(bundle: Bundle = .main, tableName: String? = nil, baseLanguage: String = "en") -> String{

        var safeValue: String?
        if let path = bundle.path(forResource: baseLanguage, ofType: "lproj"){
            let baseBundle = Bundle(path: path)
            safeValue = baseBundle?.localizedString(forKey: self, value: nil, table: tableName)
        }
        
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: safeValue ?? self, comment: self)
    }
}

public protocol L10n: RawRepresentable where RawValue == String {

    var bundle: Bundle { get }
    var tableName: String { get }
    var baseLanguage: String { get }
    var localized: String { get }
}

extension L10n{
    public var localized: String {
        return rawValue.localized(bundle: self.bundle, tableName: self.tableName, baseLanguage: self.baseLanguage)
    }
}


// MARK: - Default values for L10n type
extension L10n{
    public var bundle: Bundle {
        return .main
    }

    public var tableName: String {
        return String(describing: Self.self)
    }

    public var baseLanguage: String {
        return "en"
    }
}

extension L10n{

    /// Return the localied representation of key
    ///
    /// - Parameter key: The key used to localize
    /// - Returns: The localization representation of key
    public static func localize(_ key: Self) -> String{
        return key.localized
    }


    /// Return the localied representation of key formating with args
    ///
    /// - Parameters:
    ///   - key: The key used to localize
    ///   - args: Args used to format the resulting localized string
    /// - Returns: The localization representation of key
    public static func localize(_ key: Self, _ args: [CVarArg] = []) -> String{
        return String.init(format: key.localized, arguments: args)
    }
}
