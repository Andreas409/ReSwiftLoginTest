import Firebase

protocol FirebaseInstance {
    func createUser(email: String, password: String, dispatcher: SignInDispatcher)
    func signInUser(withEmail email: String, password: String, dispatcher: SignInDispatcher)
    
    func signOutUser()
    func signInUser(withCredential credential: FIRAuthCredential, dispatcher: SignInDispatcher)
}
