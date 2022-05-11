import 'dart:io';

import 'package:cancerapy/Bloc_Cubit/Medical_Bloc.dart';
import 'package:cancerapy/Bloc_Cubit/Medical_States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Uploading_Image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "goToHomeScreen";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(360, 690),
    );
    return BlocConsumer<MedicalCubit, MedicalStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MedicalCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 12.h),
            child: Column(
              children: [
                SizedBox(
                  height: 22.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 180.w,
                      child: Image.asset(
                        "Images/Cancerpy.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        height: 40.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: Color(0xff428DFC),
                            borderRadius: BorderRadius.circular(12.sp)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_road,
                              color: Colors.white,
                              size: 23.sp,
                            )))
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 4.w,
                    ),
                    SizedBox(
                      height: 52.h,
                      width: 230.w,
                      child: Text(
                        "Let's Diagnosis your Image",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 539.h,
                  child: ListView.builder(
                      itemCount: cubit.categories.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            height: 242.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff428DFC).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(25.sp),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        cubit.categories[index].text,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              fontSize: 25,
                                              color: Colors.black87,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: SizedBox(
                                      height: 50.h,
                                      width: 50.w,
                                      child: Image.asset(
                                        cubit.categories[index].img,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Model Confidence: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              fontSize: 15,
                                              color: Colors.blue,
                                            ),
                                      ),
                                      Text(
                                        cubit.categories[index].accuracy
                                                .toString() +
                                            '%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                              fontSize: 15,
                                              color: const Color(0xff428DFC),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xff428DFC),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(17))),
                                  height: 47.h,
                                  width: 200.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Diagnose',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.copyWith(
                                                fontSize: 20,
                                                color: Colors.white,
                                              )),
                                      Container(
                                        height: 30.h,
                                        width: 45.w,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pushNamed(
                                                    UploadingImage.routeName,
                                                    arguments: {
                                                      "url": cubit
                                                          .categories[index].url
                                                    });
                                              },
                                              icon: Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                color: Colors.blue,
                                                size: 18.sp,
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
