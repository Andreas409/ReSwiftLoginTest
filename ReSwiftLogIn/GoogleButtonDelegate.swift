import GoogleSignIn
import Google
import Firebase

extension SignInViewController: GIDSignInUIDelegate {
    
    func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            print("Google user signed in \(user)")
            guard let authentication = user.authentication else { return }
            let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            dispatcher.login(withCredential: credential)
        }
    }
}
