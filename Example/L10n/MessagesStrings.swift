//
//  MessagesStrings.swift
//  L10n_Example
//
//  Created by Dani Manuel Céspedes Lara on 2/20/18.
//  Copyright © 2018  Dani Manuel Céspedes Lara (dmanuelcl@gmail.com). All rights reserved.
//

import Foundation
import L10n

enum MessagesStrings: String, L10n{

    case textFromCodeExample = "label_text_from_code"
    case welcomeMessage = "welcome_message"
    case byeMessage = "bye_message"

    //var tableName: String = "TableName" //If no defined on code L10n will infer the table name using the same name that this instance 'MessagesStrings'
    //baseLanguage: String = "es" // If no defined L10n will use by default 'en'
    //bundle: Bundle = MiFramework.bundle // If no defined L10n will use by default 'Bundle.main'

    // Return the localization value based on self, If no defined L10n will return the localized value based on this instance's values
    //public var localized: String {
    // return rawValue.localized(bundle: self.bundle, tableName: self.tableName, baseLanguage: self.baseLanguage)
    //}
}
