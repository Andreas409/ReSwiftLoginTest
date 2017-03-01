import ReSwift

struct SignInActionLogIn: Action {}
struct SignInActionCreateAccount: Action {}
struct UpdateLoadingStateAction: Action {
    let loading: Bool
}
struct SignInActionValidateEmail: Action {
    let email: String
}
struct SignInActionValidatePassword: Action {
    let password: String
}
