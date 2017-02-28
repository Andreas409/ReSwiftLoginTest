import Firebase

class FirebaseAuthentication: FirebaseInstance {
    
    internal func signInUser(email: String, password: String) {
        print("Sign in")
    }
    
    internal func signOutUser() {
        print("Sign out")
    }
    
    internal func createUser(email: String, password: String, dispatcher: SignInDispatcher) {
        if let auth = FIRAuth.auth() {
            auth.createUser(withEmail: email, password: password) { (user, error) in
                if let user = user {
                    dispatcher.createAccountSuccess()
                }
            }
        }
    }
}
