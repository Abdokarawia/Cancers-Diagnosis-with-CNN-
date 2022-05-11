import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/SocialUserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'Login_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

  void loginUser(String email, String password) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
    });
  }

  bool obscureText = false;
  void showPassword() {
    obscureText = (!obscureText);
    if (kDebugMode) {
      print(obscureText);
    }
    emit(ChangeShowPasswordState());
  }

  void createUser(
      {required String email,
        required String password,
        required String name,
        required String phone,
        required String uid}) {
    SocialUserModel model = SocialUserModel(
        email: email,
        name: name,
        phone: phone,
        uId: uid,
        isEmailVerified: false,
        image:
        "https://i.ibb.co/ky10h4d/undraw-profile-pic-ic5t.png",
        bio:
        "Dear diet, things just aren’t looking good for the both of us. It’s not me, it’s you. You’re too much work",
        cover:
        "https://images.pexels.com/photos/358382/pexels-photo-358382.jpeg?cs=srgb&dl=pexels-pixabay-358382.jpg&fm=jpg");
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState(model));
    }).catchError((onError) {
      emit(CreateUserErrorState(onError));
    });
  }

  void registrationUser(
      String email, String password, String name, String phone) {
    emit(RegistrationLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      createUser(
          email: email,
          password: password,
          name: name,
          phone: phone,
          uid: value.user!.uid);
      emit(RegistrationSuccessState(value.user!.uid));
    }).catchError((onError) {
      emit(RegistrationErrorState(onError));
    });
  }
}
