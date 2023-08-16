import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eraa_firebase_app/screens/register_screen/cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/util/end_points/end_points.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context)=>BlocProvider.of(context);

  var formKey=GlobalKey<FormState>();

  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  Future<void> userRegister()async{
    emit(UserRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text).then((value) {

      userCreate(token: value.user!.uid);
          emit(UserRegisterSuccessState());
    }).catchError((error){

      print(error);

      emit(UserRegisterErrorState(error: error.toString()));
    });


  }

void  userCreate({
  required String token
}){
    emit(CreateUserLoadingState());
    FirebaseFirestore.instance
        .collection("users").doc(token).set({
      "name":nameController.text,
      "email":emailController.text,
      "token":token
    }).then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error){
      print("${error.toString()}");
      emit(CreateUserErrorState(error: error.toString()));
    });
}

  void clearAllData(){

   passwordController.text='';
    emailController.text='';
    nameController.text='';
  }

}
