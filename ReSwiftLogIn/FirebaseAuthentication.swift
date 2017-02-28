import Firebase

class FirebaseAuthentication: FirebaseInstance {
    
    internal func signInUser(email: String, password: String, dispatcher: SignInDispatcher) {
        //toask: just use auth()?
        if let auth = FIRAuth.auth() {
            auth.signIn(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    print("Error: \(error)")
                }
            }
        }
    }
    
    internal func signOutUser() {
        do {
            try FIRAuth.auth()?.signOut()
        } catch {
            print("Signout Error")
        }
    }
    
    internal func createUser(email: String, password: String, dispatcher: SignInDispatcher) {
        if let auth = FIRAuth.auth() {
            auth.createUser(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    dispatcher.createAccountSuccess()
                }
                if let error = error {
                    print("Error: \(error)")
                }
            }
        }
    }
}
