
abstract class LoginState {}

class LoginInitial extends LoginState {}
class UserLoginLoadingState extends LoginState {}
class UserLoginSuccessState extends LoginState {
  final String token;

  UserLoginSuccessState({
    required this.token});
}
class UserLoginErrorState extends LoginState {
  final String error;

  UserLoginErrorState({
    required this.error});
}


class GetUserDataLoadingState extends LoginState {}
class GetUserDataSuccessState extends LoginState {

}
class GetUserDataErrorState extends LoginState {
  final String error;

  GetUserDataErrorState({
    required this.error});
}