//
//  SignInViewController.swift
//  MishipayChallenge
//
//  Created by apple on 14/11/18.
//  Copyright © 2018 Praveen. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet var singUpBackButton: UIButton!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var emailSeparatorView: UIView!
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordSepearatorView: UIView!
    
    @IBOutlet var signInButtonAction: UIButton!
    
    @IBOutlet var googleButton: UIButton!
    @IBOutlet var facebookButton: UIButton!
    
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupAnimations()
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        if let tabsController: HomeTabbarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTabbarController") as? HomeTabbarController {
            self.present(tabsController, animated: true, completion: nil)
        }
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func facebookButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func forgotPasswordButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func signUpBackButtonAction(_ sender: Any) {
        if let viewController: SignUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    func setupViews() {
        self.signInButtonAction.layer.cornerRadius = 3.0
        self.signInButtonAction.clipsToBounds = true
        
        self.googleButton.layer.cornerRadius = 3.0
        self.googleButton.clipsToBounds = true
        
        self.facebookButton.layer.cornerRadius = 3.0
        self.facebookButton.clipsToBounds = true
    }
    
    func setupAnimations() {
        UIView.animate(withDuration: 1, animations: {
            self.emailTextField.frame.origin.x += self.emailTextField.frame.width
            self.emailSeparatorView.frame.origin.x += self.emailSeparatorView.frame.width
            self.passwordTextField.frame.origin.x += self.passwordTextField.frame.width
            self.passwordSepearatorView.frame.origin.x += self.passwordSepearatorView.frame.width
            self.signInButtonAction.frame.origin.x += self.signInButtonAction.frame.width
            self.googleButton.frame.origin.x += self.googleButton.frame.width
            self.facebookButton.frame.origin.x += self.facebookButton.frame.width
            self.forgotPasswordButton.frame.origin.x += self.forgotPasswordButton.frame.width
            self.singUpBackButton.frame.origin.x += self.singUpBackButton.frame.width
        }) { (_) in
            //completion
        }
    }
    
}
