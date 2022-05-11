import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/onBoarding_Model.dart';

Widget onBoardingWidget(
    BoardingModel model, BuildContext context, mediaQueryWidth) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 7.0),
    child: Column(
      children: [
        Expanded(
          flex: 7,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              model.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: double.infinity,
              child: mediaQueryWidth > 750
                  ? Text(
                      model.subtitle,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 12),
                    )
                  : Text(model.subtitle,
                      style: Theme.of(context).textTheme.headline2),
            ),
          ),
        ),
      ],
    ),
  );
}
Widget textField({
  required context,
  required String loginKey,
  required IconData icon,
  required String hitText,
  required TextEditingController textEditingController,
  required dynamic function,
  required obscureText,
  required bool isTrue,
  required BoxConstraints constraints
}) {
  return Container(
    height: constraints.maxHeight*0.17,
    width: constraints.maxWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(constraints.maxHeight*0.05),
    ),
    child: TextFormField(
      key: Key(loginKey),
      controller: textEditingController,
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Please Enter Your The Email or Password ";
        }
        return null;
      },
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff428DFC), width: 2, style: BorderStyle.solid),
          ),
           prefixIcon: Icon(icon),
          hintText: hitText,
          suffixIcon: isTrue == true
              ? IconButton(
              icon: obscureText == true
                ?  Icon(
              Icons.visibility_off,
              size: constraints.maxHeight*0.05,
              color: Colors.grey,
            )
                :  Icon(
              Icons.visibility,
              size: constraints.maxHeight*0.05,
              color: Colors.grey,
            ),
            onPressed: function,
          )
              : null,
          hintStyle: GoogleFonts.ptSans(
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                letterSpacing: .5,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )),
      obscureText: obscureText,
      style: GoogleFonts.ptSans(
          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey[900]),
    ),
  );
}

Widget textField3({
  required context,
  required String loginKey,
  required IconData icon,
  required String hitText,
  required TextEditingController textEditingController,
  required dynamic function,
  required obscureText,
  required bool isTrue,
}) {
  return Container(
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextFormField(
      key: Key(loginKey),
      controller: textEditingController,
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Please Enter Your The Email or Password ";
        }
        return null;
      },
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xffff5065), width: 2, style: BorderStyle.solid),
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.grey.withOpacity(0.9),
              size: 19,
            ),
          ),
          hintText: hitText,
          suffixIcon: isTrue == true
              ? IconButton(
            icon: obscureText == true
                ?  const Icon(
              Icons.visibility_off,
              size: 19,
              color: Colors.grey,
            )
                :  const Icon(
              Icons.visibility,
              size: 19,
              color: Colors.grey,
            ),
            onPressed: function,
          )
              : null,
          hintStyle: GoogleFonts.ptSans(
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                letterSpacing: .5,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )),
      obscureText: obscureText,
      style: GoogleFonts.ptSans(
          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey[900]),
    ),
  );
}

Widget textField4({
  required context,
  required String loginKey,
  required IconData icon,
  required String hitText,
  required TextEditingController textEditingController,
  required dynamic function,
  required obscureText,
  required bool isTrue,

}) {
  return Container(
    width: 179,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextFormField(
      key: Key(loginKey),
      controller: textEditingController,
      validator: (value) {
        if (value.toString().isEmpty) {
          return "Please Enter Your The Email or Password ";
        }
        return null;
      },
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.blue, width: 2, style: BorderStyle.solid),
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.grey.withOpacity(0.9),
              size: 19,
            ),
          ),
          hintText: hitText,
          suffixIcon: isTrue == true
              ? IconButton(
            icon: obscureText == true
                ?  const Icon(
              Icons.visibility_off,
              size: 19,
              color: Colors.grey,
            )
                :  const Icon(
              Icons.visibility,
              size: 19,
              color: Colors.grey,
            ),
            onPressed: function,
          )
              : null,
          hintStyle: GoogleFonts.ptSans(
            textStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                letterSpacing: .5,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )),
      obscureText: obscureText,
      style: GoogleFonts.ptSans(
          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.grey[900]),
    ),
  );
}