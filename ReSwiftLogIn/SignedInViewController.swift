import ReSwift
import ReSwiftRouter
import UIKit

class SignedInViewController: UIViewController {
    
    let dispatcher = SignedInDispatcher()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainStore.subscribe(self) { (state) -> SignedInState in
            return state.signedInState
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
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
        if state.userName.isEmpty {
            nameLabel.text = "User"
        } else {
            nameLabel.text = state.userName
        }
    }
}
