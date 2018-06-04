//
//  UINavigationItem+L10n.swift
//  L10n
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UINavigationItem{

    fileprivate struct AssociatedKeys {
        static var titleLocalizable: String = "titleLocalizable"
        static var promptLocalizable: String = "promptLocalizable"
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

