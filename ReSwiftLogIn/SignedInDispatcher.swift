import ReSwift
import ReSwiftRouter

struct SignedInDispatcher {
    
    let firebase = FirebaseAuthentication()
    
    func signOut() {
        firebase.signOutUser()
    }
}
