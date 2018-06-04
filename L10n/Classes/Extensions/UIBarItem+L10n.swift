//
//  UIBarItem+L10n.swift
//  L10n
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UIBarItem{

    fileprivate struct AssociatedKeys {
        static var titleLocalizable: String = "titleLocalizable"
    }


    @IBInspectable public var titleLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.titleLocalizable){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.titleLocalizable, value: value)
            self.registrateLocalizableKey(AssociatedKeys.titleLocalizable) {
                guard let key = self.titleLocalizable else {return}
                self.title = self.localizedValue(forKey: key)
            }
        }
    }
    
}

