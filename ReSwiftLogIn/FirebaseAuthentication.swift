import Firebase

class FirebaseAuthentication: FirebaseInstance {
    
    internal func logInUser(email: String, password: String, dispatcher: SignInDispatcher) {
        //toask: just use auth()?
        if let auth = FIRAuth.auth() {
            auth.signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    dispatcher.logInSuccess()
                }
                if let error = error {
                    print("Error: \(error)")
                }
            }
        }
    }
    
    internal func logOutUser() {
        print("Sign out")
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
