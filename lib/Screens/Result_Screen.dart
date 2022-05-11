import 'package:cancerapy/Bloc_Cubit/Medical_Bloc.dart';
import 'package:cancerapy/Bloc_Cubit/Medical_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = "GotoResultScreen";
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final age = arguments["age"];
    final name = arguments["name"];
    final subName = arguments["subname"];
    final city = arguments["city"];
    final country = arguments["country"];
    return BlocConsumer<MedicalCubit, MedicalStates>(
        builder: (context, state) {
          var cubit = MedicalCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Patient Profile ",
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
              ],
            ),            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color(0xff428DFC).withOpacity(0.3),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 85,
                            width: 86,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                border: Border.all(
                                  width: 5,
                                  style: BorderStyle.solid,
                                  color: Colors.white,
                                )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                "https://i.ibb.co/MNHMMmN/woman.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 25,
                                child: Text(
                                  name.toString() + " " + subName.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontSize: 22,
                                          color: Colors.black.withOpacity(0.8)),
                                ),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Container(
                                child: Text(
                                  cubit.value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontSize: 18,
                                          color: const Color(0xff428DFC)
                                              .withOpacity(0.8)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color(0xff428DFC),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 65,
                            width: 180,
                            child: Text(
                              "Share your patient profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontSize: 19, color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              {}
                            },
                            child: Container(
                              height: 60,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff00dca6)),
                              child: Center(
                                  child: FittedBox(
                                child: Text("Share Patient",
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
                  const SizedBox(
                    height: 28,
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
                                .headline5!
                                .copyWith(fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        dataRaw(context, "Name", name),
                        dataRaw(context, "SubName", subName),
                        dataRaw(context, "City", city),
                        dataRaw(context, "Gender", cubit.value),
                        dataRaw(context, "Country", country),
                        dataRaw(context, "Age", age + " Years"),
                      ],
                    ),
                  ),

                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color(0xff428DFC),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 180,
                                child: Text(
                                  "Class Name",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(fontSize: 19, color: Colors.white),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  {}
                                },
                                child: Container(
                                  height: 55,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xff00dca6)),
                                  child: Center(
                                      child: FittedBox(
                                        child: Text(cubit.response2!["class_name"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(fontSize: 17)),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 180,
                                child: Text(
                                  "Diagnosis Confidence",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(fontSize: 19, color: Colors.white),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  {}
                                },
                                child: Container(
                                  height: 50,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: const Color(0xff00dca6)),
                                  child: Center(
                                      child: FittedBox(
                                        child: Text(cubit.response2!["confidence"].toString() + " %",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4!
                                                .copyWith(fontSize: 19)),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}

Widget dataRaw(context, text1, text2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        alignment: Alignment.topLeft,
        height: 46,
        child: FittedBox(
          child: Text(
            text1,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontSize: 17, color: Colors.grey),
          ),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        height: 46,
        child: FittedBox(
          child: Text(
            text2,
            style:
                Theme.of(context).textTheme.headline3!.copyWith(fontSize: 17),
          ),
        ),
      ),
    ],
  );
}
