//
//  UILabel+L10n.swift
//  L10n
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UILabel{

    fileprivate struct AssociatedKeys {
        static var textLocalizable: String = "textLocalizable"
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
}
