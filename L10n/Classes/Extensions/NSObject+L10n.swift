//
//  NSObject+L10n.swift
//  L10n
//
//  Created by Dani Manuel Céspedes Lara on 4/28/18.
//  Copyright © 2018  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import Foundation

public extension NSObject{

    typealias LocalizationCallback = () -> Void

    fileprivate struct AssociatedKeys {
        static var keyPathLocalizedCallbacks: String = "localizationCallbacks"
        static var bundleIdentifier: String = "bundleIdentifier"
        static var tableName: String = "tableName"
        static var defaultLanguage: String = "defaultLanguage"
    }

    private var localizationCallbacks: [String: LocalizationCallback]{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.keyPathLocalizedCallbacks){
                return [:]
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.keyPathLocalizedCallbacks, value: value)
        }
    }

    func localizedValue(forKey key: String) -> String{
        var bundle = Bundle.main
        if let bundleIdentifier = self.bundleIdentifier, let _bundle = Bundle(identifier: bundleIdentifier){
            bundle = _bundle
        }
        let localizedValue = key.localized(bundle: bundle, tableName: self.tableName, baseLanguage: self.defaultLang)
        return localizedValue
    }

    /// Register a callback for `keyPath` to notify of any localizable attrs change.
    ///
    /// The localizable key should be set on subclasses before the `bundleClass`, `tableName` or `defaultLang` on NSObejct, we attempt to keep up to date for the right localization values
    ///
    /// - Parameters:
    ///   - keyPath: The key used to identify the `localizationCallback`
    ///   - localizationCallback: Called when changes when any localizable attrs change occur
    func registrateLocalizableKey(_ key: String, with localizationCallback: @escaping LocalizationCallback){
        self.localizationCallbacks.updateValue(localizationCallback, forKey: key)

        //trigger a localizable attr change to localize the new added keyPath
        self.handleLocalizableAttrsChange()
    }

    /// Call all registrated localization callbacks
    private func handleLocalizableAttrsChange(){
        self.localizationCallbacks.forEach { (args) in
            let (_, callback) = args
            //Always use the main queue to perform the updates
            DispatchQueue.main.async {
                callback()
            }
        }
    }

    /// Define an identifier to create the bundle for localization, the bundle is created by calling `Bundle(for:)`, default is `Bundle.main`
    @IBInspectable public var bundleIdentifier: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.bundleIdentifier){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.bundleIdentifier, value: value)
            self.handleLocalizableAttrsChange()
        }
    }


    /// The table to find the localizable key, default is `Localizable`
    @IBInspectable public var tableName: String{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.tableName){
                return "Localizable"
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.tableName, value: value)
            self.handleLocalizableAttrsChange()
        }
    }

    /// Define the default language to use if the key does not exists on the current language or table, deault is `en`
     @IBInspectable public var defaultLang: String{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.defaultLanguage){
                return "en"
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.defaultLanguage, value: value)
            self.handleLocalizableAttrsChange()
        }
    }

}
