import 'package:cancerapy/Bloc_Cubit/Login_Bloc.dart';
import 'package:cancerapy/Bloc_Cubit/Login_States.dart';
import 'package:cancerapy/Screens/Home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Components/Login_Widget.dart';
import 'Signup_Screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = "goToLoginScreen";
  final dynamic textEditingController1 = TextEditingController();
  final dynamic emailEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    );
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryTop = MediaQuery.of(context).padding.top;
    final mediaQuery =
        (mediaQueryHeight - appBar.preferredSize.height - mediaQueryTop);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamed(
              context, HomeScreen.routeName);
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              physics: const ScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Form(
                    key: formKey,
                    child: SizedBox(
                      height: mediaQuery,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                             "Images/medical_researh.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: mediaQuery * 0.01),
                          Padding(
                            padding: EdgeInsets.all(mediaQuery * 0.008),
                            child: Container(
                              alignment: Alignment.topLeft,
                              height: mediaQuery * 0.050,
                              child: FittedBox(
                                child: Text(
                                  "Login",
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery * 0.02,
                          ),
                          Expanded(
                              flex: 5,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Column(children: [
                                    textField(
                                        loginKey: 'email',
                                        context: context,
                                        icon: Icons.email_outlined,
                                        hitText: "Email ID ",
                                        textEditingController:
                                            emailEditingController,
                                        function: () {},
                                        obscureText: false,
                                        isTrue: false,
                                        constraints: constraints),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.02,
                                    ),
                                    textField(
                                        loginKey: 'password',
                                        context: context,
                                        icon: Icons.lock_outline,
                                        hitText: "Password",
                                        textEditingController:
                                            textEditingController1,
                                        function: () {
                                          cubit.showPassword();
                                        },
                                        obscureText: !cubit.obscureText ,
                                        isTrue: true,
                                        constraints: constraints),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.05,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.loginUser(
                                              emailEditingController.text,
                                              textEditingController1.text);
                                        }
                                      },
                                      child: state is LoginLoadingState
                                          ? const CircularProgressIndicator(
                                              color: Color(0xff428DFC),
                                            )
                                          : Container(
                                              height:
                                                  constraints.maxHeight * 0.118,
                                              width: constraints.maxWidth *0.96,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          constraints
                                                                  .maxHeight *
                                                              0.025),
                                                  color:
                                                      const Color(0xff428DFC)),
                                              child: Center(
                                                child: SizedBox(
                                                  height: constraints.maxHeight * 0.064,
                                                  width: constraints.maxWidth *0.22,
                                                  child: FittedBox(
                                                    child: Text("Login",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline4),
                                                  ),
                                                )
                                              ),
                                            ),
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * .047,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: constraints.maxHeight * .1,
                                          width: constraints.maxWidth * 0.45,
                                          child: FittedBox(
                                            child: Text(
                                              "Already have an account ? ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, SignUp.routeName);
                                          },
                                          child: SizedBox(
                                            height: constraints.maxHeight * .11,
                                            width: constraints.maxWidth * 0.27,
                                            child: FittedBox(
                                              child: Text(
                                                "Registration",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]);
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
