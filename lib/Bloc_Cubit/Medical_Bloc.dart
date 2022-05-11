
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'Medical_States.dart';

class MedicalCubit extends Cubit<MedicalStates> {
  MedicalCubit() : super(MedicalInitialState());

  static MedicalCubit get(context) {
    return BlocProvider.of(context);
  }

  var value = "Female";

   changeItem(item){
    value = item;
    emit(MedicalLoadModelSuccessState());
  }
  List<String> items = ["Female" , "Male"];
 List<Category> categories = [
   Category(
     id: "Breast",
     color: Colors.white,
     img: "Images/ribbon.png",
     text: "Breast Cancer",
     url: "http://192.168.1.43:5000/breast",
     accuracy: 88

   ),
   Category(
       id: "Skin",
       color: Colors.white,
       img: "Images/skin.png",
       text: "Skin Cancer",
       url: "http://192.168.1.43:5000/skin",
       accuracy: 81
   ),
   Category(
       id: "Colon and Rectum",
       color: Colors.white,
       img: "Images/stomach.png",
       text: "Colon and Rectum",
       url: "http://192.168.1.43:5000/colorectal",
       accuracy: 89
   ),
   Category(
       id: "Lung",
       color: Colors.white,
       img: "Images/lung-cancer.png",
       text: "Lung Cancer",
       url: "Coming Soon",
       accuracy: 90
   ),

 ];
  File? image;
  Map<dynamic,dynamic>? response2;
  final ImagePicker picker = ImagePicker();

  Future getImage(url) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image =  File(pickedFile.path);
      emit(MedicalLoadModelSuccessState());
    } else {
      print('No image selected.');
      emit(MedicalErrorState());
    }
  }

  onUploadImage(url) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'imagefile',
        image!.readAsBytes().asStream(),
        image!.lengthSync(),
        filename: image!.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
    response2 = json.decode(response.body);
    emit(MedicalLoadModelSuccessState());
    print(response2);
  }
}
class Category {
  final String text, id , img , url;
  final Color color;
  final int accuracy;

  Category(
      {required this.text,
        required this.url,
        required this.color,
        required this.img,
        required this.id,
      required this.accuracy});
}