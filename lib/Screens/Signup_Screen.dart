
import 'package:cancerapy/Screens/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc_Cubit/Login_Bloc.dart';
import '../Bloc_Cubit/Login_States.dart';
import '../Components/Login_Widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static const routeName = "goToSignupScreen";
  @override
  Widget build(BuildContext context) {
    var emailEditingController2 = TextEditingController();
    var textEditingController2 = TextEditingController();
    var passwordEditingController2 = TextEditingController();
    var phoneEditingController2 = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is RegistrationSuccessState) {
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        }
      },
      builder: (BuildContext context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 320,
                      width: 700,
                      child: Image.network(
                        "https://i.ibb.co/3y1dVry/undraw-Walking-outside-re-56xo-2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign Up ",
                          style: Theme.of(context).textTheme.headline1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(children: [

                      textField3(
                          context: context,
                          icon: Icons.person,
                          hitText: "Ful Name ",
                          textEditingController: textEditingController2,
                          function: () {},
                          obscureText: false,
                          isTrue: false, loginKey: ''),
                      const SizedBox(height: 15),
                      textField3(
                          context: context,
                          icon: Icons.email,
                          hitText: "Email ID ",
                          textEditingController: emailEditingController2,
                          function: () {},
                          isTrue: false,
                          obscureText: false, loginKey: ''),
                      const SizedBox(height: 15),
                      textField3(
                          context: context,
                          icon: Icons.lock,
                          hitText: "Password",
                          textEditingController: passwordEditingController2,
                          function: () {
                            cubit.showPassword();
                          },
                          obscureText: !cubit.obscureText,
                          isTrue: true, loginKey: ''),
                      const SizedBox(height: 15),
                      textField3(
                          context: context,
                          icon: Icons.phone,
                          hitText: "Phone",
                          textEditingController: phoneEditingController2,
                          function: () {},
                          obscureText: false,
                          isTrue: false, loginKey: ''),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          cubit.registrationUser(
                              emailEditingController2.text,
                              passwordEditingController2.text,
                              textEditingController2.text,
                              phoneEditingController2.text);
                        },
                        child: state is RegistrationLoadingState
                            ? const CircularProgressIndicator()
                            : Container(
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:
                              const Color(0xffff3b2f).withOpacity(1)),
                          child: Center(
                            child: Text("Sign in",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}