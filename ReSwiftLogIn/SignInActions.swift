import ReSwift

struct SignInActionLogIn: Action {
    let email: String
}
struct SignInActionCreateAccount: Action {
    let email: String
}
struct UpdateLoadingStateAction: Action {
    let loading: Bool
}
struct SignInActionValidateEmail: Action {
    let email: String
}
struct SignInActionValidatePassword: Action {
    let password: String
}
