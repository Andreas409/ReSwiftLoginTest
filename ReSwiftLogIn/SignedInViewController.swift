import ReSwift
import ReSwiftRouter
import UIKit

class SignedInViewController: UIViewController {
    
    let dispatcher = SignedInDispatcher()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSignOut(_ sender: Any) {
        dispatcher.signOut()
    }
}

extension SignedInViewController: StoreSubscriber {
    func newState(state: SignedInState) {
        handle(state: state)
    }
    
    func handle(state: SignedInState) {
        if !state.userName.isEmpty {
            nameLabel.text = state.userName
        } else {
            nameLabel.text = "User"
        }
    }
}
