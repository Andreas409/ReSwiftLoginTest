import ReSwift

struct SignInActionLogIn: Action {
    let email: String
    let password: String
}
struct SignInActionCreateAccount: Action {
    let email: String
    let password: String
}
struct SignInActionValidateEmail: Action {
    let email: String
}
struct SignInActionValidatePassword: Action {
    let password: String
}
struct SignInActionCreatedAccount: Action {
    
}
