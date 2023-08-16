
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class UserRegisterLoadingState extends RegisterState {}
class UserRegisterSuccessState extends RegisterState {}
class UserRegisterSuccessWithExceptionState extends RegisterState {
  final String message;

  UserRegisterSuccessWithExceptionState({
    required this.message});
}
class UserRegisterErrorState extends RegisterState {
  final String error;

  UserRegisterErrorState({required this.error});
}


class CreateUserLoadingState extends RegisterState {}
class CreateUserSuccessState extends RegisterState {}
class CreateUserErrorState extends RegisterState {
  final String error;

  CreateUserErrorState({required this.error});
}