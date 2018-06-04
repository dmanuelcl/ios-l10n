//
//  UISegmentedControl+L10n.swift
//  L10n
//
//  Created by Dani Manuel on 10/13/17.
//  Copyright © 2017  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//


import UIKit

public extension UISegmentedControl{

    fileprivate struct AssociatedKeys {
        static var titlesLocalizable: String = "titlesLocalizable"
    }

    @IBInspectable public var titlesLocalizable: String?{
        get{
            return associatedObject(base: self, key: &AssociatedKeys.titlesLocalizable){
                return nil
            }
        }
        set(value){
            associateObject(base: self, key: &AssociatedKeys.titlesLocalizable, value: value)
            self.registrateLocalizableKey(AssociatedKeys.titlesLocalizable) {
                guard let _titles = self.titlesLocalizable else {return}
                let titles = _titles.components(separatedBy: ",")
                for i in 0 ..< titles.count{
                    guard i < self.numberOfSegments else{
                        return
                    }
                    let localizableKey = titles[i]
                    let title = self.localizedValue(forKey: localizableKey)
                    self.setTitle(title, forSegmentAt: i)
                }
            }
        }
    }
}

