import Firebase

protocol FirebaseInstance {
    func createUser(email: String, password: String, dispatcher: SignInDispatcher)
    func signInUser(email: String, password: String)
    func signOutUser()
}
