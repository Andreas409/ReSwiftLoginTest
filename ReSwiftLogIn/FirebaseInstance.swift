import Firebase

protocol FirebaseInstance {
    func createUser(email: String, password: String, dispatcher: SignInDispatcher)
    func logInUser(email: String, password: String, dispatcher: SignInDispatcher)
    func logOutUser()
}
