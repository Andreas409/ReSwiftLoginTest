import ReSwift
import ReSwiftRouter
import FBSDKLoginKit
import GoogleSignIn

struct SignedInDispatcher {
    
    let firebase = FirebaseAuthentication()
    
    func signOut() {
        signOutFirebase()
        signOutGoogle()
        signOutFacebook()
    }
    
    private func signOutFirebase() {
        firebase.signOutUser()
    }
    
    private func signOutGoogle() {
        GIDSignIn.sharedInstance().signOut()
    }
    
    private func signOutFacebook() {
        FBSDKLoginManager().logOut()
    }
}
