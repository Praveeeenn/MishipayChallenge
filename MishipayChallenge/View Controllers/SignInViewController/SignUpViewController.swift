//
//  SignUpViewController.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var firstNameSeparatorView: UIView!
    
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var lastNameSeparatorView: UIView!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var emailSeparatorView: UIView!
    
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var passwordSeparatorView: UIView!
    
    @IBOutlet var confirmPasswordTextfield: UITextField!
    @IBOutlet var confirmTextSeperatorView: UIView!
    
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var signInBackButton: UIButton!
    
    @IBOutlet var googleSignInButton: UIButton!
    @IBOutlet var facebookSignInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupAnimations()
    }
    
    @IBAction func signupButtonAction(_ sender: Any) {
        if let tabsController: HomeTabbarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTabbarController") as? HomeTabbarController {
            self.present(tabsController, animated: true, completion: nil)
        }
    }
    
    @IBAction func googleSignInAction(_ sender: Any) {
        
    }
    
    @IBAction func facebookSignInAction(_ sender: Any) {
        
    }
    
    
    @IBAction func signInBackButtonAction(_ sender: Any) {
        if let viewController: SignInViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    func setupViews() {
        self.signupButton.layer.cornerRadius = 3.0
        self.signupButton.clipsToBounds = true
        
        self.googleSignInButton.layer.cornerRadius = 3.0
        self.googleSignInButton.clipsToBounds = true
        
        self.facebookSignInButton.layer.cornerRadius = 3.0
        self.facebookSignInButton.clipsToBounds = true
    }
    
    func setupAnimations() {
        UIView.animate(withDuration: 1, animations: {
            self.emailTextField.frame.origin.x += self.emailTextField.frame.width
            self.emailSeparatorView.frame.origin.x += self.emailSeparatorView.frame.width
            self.firstNameTextField.frame.origin.x += self.firstNameTextField.frame.width
            self.firstNameSeparatorView.frame.origin.x += self.firstNameSeparatorView.frame.width
            self.lastNameTextField.frame.origin.x += self.lastNameTextField.frame.width
            self.lastNameSeparatorView.frame.origin.x += self.lastNameSeparatorView.frame.width
            self.passwordTextfield.frame.origin.x += self.passwordTextfield.frame.width
            self.passwordSeparatorView.frame.origin.x += self.passwordSeparatorView.frame.width
            self.confirmPasswordTextfield.frame.origin.x += self.confirmPasswordTextfield.frame.width
            self.confirmTextSeperatorView.frame.origin.x += self.confirmTextSeperatorView.frame.width
            self.signupButton.frame.origin.x += self.signupButton.frame.width
            self.signInBackButton.frame.origin.x += self.signInBackButton.frame.width
            self.googleSignInButton.frame.origin.x += self.googleSignInButton.frame.width
            self.facebookSignInButton.frame.origin.x += self.facebookSignInButton.frame.width
        }) { (_) in
            //completion
        }
    }
    

}
