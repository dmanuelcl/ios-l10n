//
//  UIViewController+L10n.swift
//  L10n
//
//  Created by Dani Manuel Céspedes Lara on 2/20/18.
//  Copyright © 2018  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit

public extension UIViewController{

    fileprivate struct AssociatedKeys {
        static var titleLocalizable: String = "titleLocalizable"
        static var tabBarTitleLocalizable: String = "tabBarTitleLocalizable"
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

    @IBInspectable public var tabBarTitleLocalizable: String?{
        get{
            return self.tabBarItem.titleLocalizable
        }
        set(value){
            self.tabBarItem.titleLocalizable = value
        }
    }

}


