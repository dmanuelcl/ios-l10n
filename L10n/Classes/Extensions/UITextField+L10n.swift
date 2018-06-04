//
//  UITextField+Localizable.swift
//  localizationTest
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UITextField{

    fileprivate struct AssociatedKeys {
        static var textLocalizable: String = "textLocalizable"
        static var placeholderLocalizable: String = "placeholderLocalizable"
    }

    @IBInspectable var textLocalizable: String?{
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

    @IBInspectable var placeholderLocalizable: String?{
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

}
