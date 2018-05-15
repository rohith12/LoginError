//
//  ViewController.swift
//  LoginDemo
//
//  Created by Rohith Raju on 15/05/18.
//  Copyright © 2018 Rohith Raju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum LoginError: Error{
        case incompleteForm
        case invalidEmaild
        case incorrectPassword
    }
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(_ sender: Any) {
        
        do{
            try login()
            
            
        }catch LoginError.incompleteForm{
            Alert.showBasic(title: "Incomplete Form", message: "Please fill out both email and password fields", vc: self)

        } catch LoginError.invalidEmaild {
            Alert.showBasic(title: "Invalid Email Format", message: "Please make sure you format your email correctly", vc: self)
        } catch LoginError.incorrectPassword {
            Alert.showBasic(title: "Password Too Short", message: "Password should be at least 8 characters", vc: self)
        } catch {
            Alert.showBasic(title: "Unable To Login", message: "There was an error when attempting to login", vc: self)
        }
    }
    
    func login() throws{
        
       let email = emailTextfield.text!
       let password = passwordTextfield.text!
       
        if !email.isValidEmail{
          throw LoginError.invalidEmaild
        }
        
        if email.isEmpty || password.isEmpty{
            throw LoginError.incompleteForm
        }
        
        if password.count < 10{
            throw LoginError.incorrectPassword
        }
       
    }
    
}

