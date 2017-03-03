import ReSwift
import ReSwiftRouter
import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn

class SignInViewController: UIViewController {
    typealias StoreSubscriberStateType = SignInState
    
    @IBOutlet weak var FBLoginButton: FBSDKLoginButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorField: UILabel!
    let dispatcher = SignInDispatcher()
    
    @IBAction func didTapLogIn(_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text {
            dispatcher.login(withEmail: email, password: password)
        }
    }
    
    @IBAction func didTapCreateAccount(_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text {
            dispatcher.createAccount(email: email, password: password)
        }
    }
    
    fileprivate func enableLoadingState() {
        //toask: better way to do this? -> new view above with partail opacity on white bg with indicator?
        createAccountButton.isEnabled = false
        createAccountButton.alpha = 0.5
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        emailField.isEnabled = false
        emailField.alpha = 0.5
        emailField.isEnabled = false
        emailField.alpha = 0.5
        passwordField.isEnabled = false
        passwordField.alpha = 0.5
        activityIndicator.startAnimating()
    }
    
    fileprivate func disableLoadingState() {
        createAccountButton.isEnabled = true
        createAccountButton.alpha = 1
        loginButton.isEnabled = true
        loginButton.alpha = 1
        emailField.isEnabled = true
        emailField.alpha = 1
        emailField.isEnabled = true
        emailField.alpha = 1
        passwordField.isEnabled = true
        passwordField.alpha = 1
        activityIndicator.stopAnimating()
    }

}

extension SignInViewController: StoreSubscriber {
    func newState(state: SignInState) {
        handle(state: state)
    }
    
    func handle(state: SignInState) {
        //toask handle all this nicer?
        if !state.errorMessage.isEmpty {
            errorField.text = state.errorMessage
        } else {
            errorField.text = ""
        }
        
        if state.loading {
            enableLoadingState()
        } 
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case emailField:
            if let email = emailField.text {
                dispatcher.validateEmail(email: email)
            }
        case passwordField:
            if let password = passwordField.text {
                dispatcher.validatePassword(password: password)
            }
        default:
            break
        }
        return true
    }
}

extension SignInViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignTextFieldDelegates()
        setupScene()
        setupFacebook()
        checkFBLogIn()
        setupGoogleSignIn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self) { (state) -> SignInState in
            return state.signInState
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }
    
    private func assignTextFieldDelegates() {
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    private func setupFacebook() {
        FBLoginButton.delegate = self
        FBLoginButton.readPermissions = ["public_profile", "email"]
    }
    
    private func setupScene() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
    
    private func checkFBLogIn() {
        if let token = FBSDKAccessToken.current() {
            print("user is logged in: \(token)")
        }
    }
}
