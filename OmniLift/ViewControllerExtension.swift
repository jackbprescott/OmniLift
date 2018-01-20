//
//  ViewControllerExtension.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/20/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        /* Hides keyboard when you tap outside of it */
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
