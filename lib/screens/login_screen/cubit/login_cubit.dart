import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eraa_firebase_app/screens/login_screen/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../core/services/dio_helper.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);
  var formKey=GlobalKey<FormState>();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  Future<void> userLogin()async{


    emit(UserLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text).then((value) {
          emit(UserLoginSuccessState(token:value.user!.uid));
    }).catchError((error){
      emit(UserLoginErrorState(error: error.toString()));
    });
  }


  getUserData({
    required String token
}){
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance.collection("users")
        .doc(token).get().then((value) {
          print("user data${value.data()!}");

emit(GetUserDataSuccessState());
    }).catchError((error){
emit(GetUserDataErrorState(error: error.toString()));
    });
  }
  
}
