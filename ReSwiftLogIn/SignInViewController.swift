import ReSwift
import UIKit

class SignInViewController: UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = SignInState
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStore.subscribe(self)
    }
    
    func newState(state: SignInState) {
        //todo handle new state
    }
    
    @IBAction func didTapLogIn(_ sender: AnyObject) {
        mainStore.dispatch(SignInActionLogIn)
    }
    
    @IBAction func didTapCreateAccount(_ sender: AnyObject) {
        mainStore.dispatch(SignInActionCreateAccount)
    }
}
