import ReSwift
import UIKit

class SignInViewController: UIViewController {
    typealias StoreSubscriberStateType = SignInState
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorField: UILabel!
    let dispatcher = SignInDispatcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignTextFieldDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }
    
    private func assignTextFieldDelegates() {
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func didTapLogIn(_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text {
            dispatcher.login(email: email, password: password)
        }
    }
    
    @IBAction func didTapCreateAccount(_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text {
            dispatcher.createAccount(email: email, password: password)
        }
    }
}

extension SignInViewController: StoreSubscriber {
    func newState(state: SignInState) {
        if state.loading {
            errorField.text = "Waiting for data"
            errorField.textColor = UIColor.blue
        } else {
            if state.signedIn {
                print("signed in")
                errorField.text = "Logged in!"
                errorField.textColor = UIColor.green
            }
        }
        
        if !state.errorMessage.isEmpty {
            errorField.text = state.errorMessage
        } else {
            errorField.text = ""
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
