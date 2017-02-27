import ReSwift

struct SignInState: StateType {
    var userEmail: String = ""
    var userPassword: String = ""
    var errorMessage: String = ""
}
