//
//  UISearchBar+L10n.swift
//  L10n
//
//  Created by Dani Manuel Céspedes Lara on 10/26/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UISearchBar{
    
    fileprivate struct AssociatedKeys {
        static var textLocalizable: String = "textLocalizable"
        static var placeholderLocalizable: String = "placeholderLocalizable"
        static var promptLocalizable: String = "promptLocalizable"
    }
    
    @IBInspectable public var textLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.textLocalizable){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.textLocalizable, value: value)
            self.registrateLocalizableKey(AssociatedKeys.textLocalizable) {
                guard let key = self.textLocalizable else {return}
                self.text = self.localizedValue(forKey: key)
            }
        }
    }
    
    @IBInspectable public var placeholderLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.placeholderLocalizable){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.placeholderLocalizable, value: value)
            self.registrateLocalizableKey(AssociatedKeys.placeholderLocalizable) {
                guard let key = self.placeholderLocalizable else {return}
                self.placeholder = self.localizedValue(forKey: key)
            }
        }
    }


    @IBInspectable public var promptLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.promptLocalizable){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.promptLocalizable, value: value)

            self.registrateLocalizableKey(AssociatedKeys.promptLocalizable) {
                guard let key = self.promptLocalizable else {return}
                self.prompt = self.localizedValue(forKey: key)
            }
        }
    }
    
}

