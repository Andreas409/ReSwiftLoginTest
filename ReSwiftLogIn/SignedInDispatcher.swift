import ReSwift
import ReSwiftRouter
import FBSDKLoginKit

struct SignedInDispatcher {
    
    let firebase = FirebaseAuthentication()
    
    func signOut() {
        firebase.signOutUser()
    }
}
