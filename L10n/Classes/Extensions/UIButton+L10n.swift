//
//  UIButton+L10n.swift
//  L10n
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import UIKit


extension UIButton{

    fileprivate struct AssociatedKeys {
        static var localizableTitle: String = "localizableTitle"
        static var highlightedTitle: String = "highlightedTitle"
        static var selectedTitle: String = "selectedTitle"
        static var disabledTitle: String = "disabledTitle"
    }

    func setLocalizedTitle(withKey key: String?, for state: UIControlState){
        guard let key = key else {return}
        let localizedValue = self.localizedValue(forKey: key)
        self.setTitle(localizedValue, for: state)
    }

    @IBInspectable public var titleLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.localizableTitle){
                return nil
            }
        }

        set(value){
            associateObject(base: self, key: &AssociatedKeys.localizableTitle, value: value)
            self.registrateLocalizableKey(AssociatedKeys.localizableTitle) {
                self.setLocalizedTitle(withKey: self.titleLocalizable, for: .normal)
            }
        }
    }

    @IBInspectable public var highlightedTitleLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.highlightedTitle){
                return nil
            }
        }

        set(value){
            associateObject(base: self, key: &AssociatedKeys.highlightedTitle, value: value)
            self.registrateLocalizableKey(AssociatedKeys.highlightedTitle) {
                self.setLocalizedTitle(withKey: self.highlightedTitleLocalizable, for: .highlighted)
            }
        }
    }

    @IBInspectable public var selectedTitleLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.selectedTitle){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.selectedTitle, value: value)
            self.registrateLocalizableKey(AssociatedKeys.selectedTitle) {
                self.setLocalizedTitle(withKey: self.selectedTitleLocalizable, for: .selected)
            }
        }
    }

    @IBInspectable public var disabledTitleLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.disabledTitle){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.disabledTitle, value: value)
            self.registrateLocalizableKey(AssociatedKeys.disabledTitle) {
                self.setLocalizedTitle(withKey: self.disabledTitleLocalizable, for: .disabled)
            }
        }
    }
}

