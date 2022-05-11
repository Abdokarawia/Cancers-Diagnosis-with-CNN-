import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc_Cubit/Medical_Bloc.dart';
import '../Bloc_Cubit/Medical_States.dart';
import '../Components/Login_Widget.dart';
import 'Result_Screen.dart';

class UploadingImage extends StatelessWidget {

   UploadingImage({Key? key}) : super(key: key);
  static const routeName = "UploadingImage";

  final dynamic name = TextEditingController();
  final dynamic subName = TextEditingController();
  final dynamic age = TextEditingController();
  final dynamic city = TextEditingController();
  final dynamic country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
    );
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final url = arguments["url"];
    print(url);

    return BlocConsumer<MedicalCubit, MedicalStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MedicalCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Upload Image ",
              style:
                  Theme.of(context).textTheme.headline3!.copyWith(fontSize: 22),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
              color: const Color(0xff428DFC),
              iconSize: 22,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 30.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: const Color(0xff428DFC),
                        borderRadius: BorderRadius.circular(12.sp)),
                    child: IconButton(
                        onPressed: () {
                          cubit.getImage(url);
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 23.sp,
                        ))),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 12.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  cubit.image != null
                      ? SizedBox(
                          height: 200.h,
                          width: 600.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              cubit.image!,
                              fit: BoxFit.fill,
                            ),
                          ))
                      : Container(
                          height: 200.h,
                          width: 600.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.black26, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.cloud_upload_outlined,
                                      color: const Color(0xff428DFC),
                                      size: 60.sp,
                                    )),
                                SizedBox(
                                  height: 32.h,
                                ),
                                SizedBox(
                                  height: 52.h,
                                  child: Text(
                                    "Click on Button to Upload from Gallery",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(fontSize: 19),
                                  ),
                                ),
                              ],
                            ),
                          )),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 58,
                        child: FittedBox(
                          child: Text(
                            "Patient details",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          textField4(
                              context: context,
                              icon: Icons.person,
                              hitText: "Name ",
                              textEditingController: name,
                              function: () {},
                              obscureText: false,
                              isTrue: false,
                              loginKey: ''),
                          const SizedBox(
                            width: 25,
                          ),
                          textField4(
                              context: context,
                              icon: Icons.supervised_user_circle,
                              hitText: "Sub Name ",
                              textEditingController: subName,
                              function: () {},
                              obscureText: false,
                              isTrue: false,
                              loginKey: ''),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          textField4(
                              context: context,
                              icon: Icons.account_balance_rounded,
                              hitText: "Country",
                              textEditingController: country,
                              function: () {},
                              obscureText: false,
                              isTrue: false,
                              loginKey: ''),
                          const SizedBox(
                            width: 25,
                          ),
                          textField4(
                              context: context,
                              icon: Icons.location_city,
                              hitText: "City",
                              textEditingController: city,
                              function: () {},
                              obscureText: false,
                              isTrue: false,
                              loginKey: ''),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Container(
                            width: 179,
                            child: DropdownButtonFormField(
                              iconSize: 20,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              value: cubit.value,
                              icon: const Icon(Icons.male),
                              items: cubit.items.map((String items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                              onChanged: (newValue) {
                                cubit.changeItem(newValue);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          textField4(
                              context: context,
                              icon: Icons.supervised_user_circle,
                              hitText: "Age",
                              textEditingController: age,
                              function: () {},
                              obscureText: false,
                              isTrue: false,
                              loginKey: ''),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  InkWell(
                    onTap: () async {
                      {
                        await cubit.onUploadImage(url);
                        Navigator.of(context)
                            .pushNamed(ResultScreen.routeName, arguments: {
                          "age": age.text,
                          "name": name.text,
                          "subname": subName.text,
                          "country": country.text,
                          "city": city.text,
                        });


                      }
                    },
                    child: Container(
                      height: 55,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color(0xff428DFC)),
                      child: Center(
                          child: FittedBox(
                        child: Text("Add Patient Details",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(fontSize: 19)),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
