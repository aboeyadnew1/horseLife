import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourse_life/bloc/state.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/models/user.dart';
import 'package:hourse_life/pages/home_page/home.dart';
import 'package:image_picker/image_picker.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeIntialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  UserModel user;
  void getVendorData() {
    emit(GetVendorDataLoading());
    FirebaseFirestore.instance
        .collection('Vendors')
        .doc(user.id)
        .get()
        .then((value) {
      user = UserModel.fromMap(value.data());
      emit(GetVendorDataSucsses());
    }).catchError((er) {
      emit(GetVendorDataError());

      print(er.toString());
    });
  }

  void updateVendorData({
    String address,
    String lat,
    String job,
    String email,
    String long,
    String name,
    String phone,
    String recordNumber,
    String personalIdentity,
  }) {
    UserModel model = UserModel(
      address: address,
      email: email,
      job: job,
      lat: lat,
      long: long,
      name: name,
      phone: phone,
      recordNumber: recordNumber,
      personalIdentity: personalIdentity,
    );
    emit(UpdateVendorDataLoading());
    FirebaseFirestore.instance
        .collection('Vendors')
        .doc(user.id)
        .update(model.toMap())
        .then((value) {
      emit(UpdateVendorDataSucsses());
    }).catchError((er) {
      emit(UpdateVendorDataError());

      print(er.toString());
    });
  }

  File imageService;
  final picker = ImagePicker();
  void setImagePicker() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageService = File(image.path);
      emit(SetImageServicesSucsses());
    } else {
      print('no image found');
    }
  }

  void storegeImageServices({
    String deliveryMethod,
    String mainServiceType,
    String name,
    String personalIdentity,
    String price,
    String description,
    String deliveryTime,
    String quantity,
    String rate,
    String subServiceType,
    String vendor_id,
  }) {
    emit(StoregeImageServicesLoading());

    FirebaseStorage.instance
        .ref()
        .child('services/${Uri.file(imageService.path).pathSegments.last}')
        .putFile(imageService)
        .then((value) {
      value.ref.getDownloadURL().then((val) {
        updateVendorServices(
          deliveryMethod: deliveryMethod,
          deliveryTime: deliveryTime,
          description: description,
          image: val,
          mainServiceType: mainServiceType,
          name: name,
          personalIdentity: personalIdentity,
          price: price,
          quantity: quantity,
          rate: rate,
          subServiceType: subServiceType,
          vendor_id: vendor_id,
        );
        emit(StoregeImageServicesSucsses());
      }).catchError((er) {
        emit(StoregeImageServicesError());

        print(er.toString());
      });
    }).catchError((er) {
      emit(StoregeImageServicesError());

      print(er.toString());
    });
  }

  ServiceModel serviceModel;
  void getVendorServices() {
    emit(GetVendorServicesLoading());
    FirebaseFirestore.instance
        .collection('service')
        .doc(serviceModel.id)
        .get()
        .then((value) {
      serviceModel = ServiceModel.fromJson(value.data());
      emit(GetVendorServicesSucsses());
    }).catchError((er) {
      emit(GetVendorServicesError());

      print(er.toString());
    });
  }

  void updateVendorServices({
    String deliveryMethod,
    String deliveryTime,
    String description,
    String email,
    String image,
    String name,
    dynamic price,
    String mainServiceType,
    String personalIdentity,
    dynamic quantity,
    dynamic rate,
    String subServiceType,
    String vendor_id,
  }) {
    ServiceModel model = ServiceModel(
      deliveryMethod: deliveryMethod,
      deliveryTime: deliveryTime,
      description: description,
      image: image,
      mainServiceType: mainServiceType,
      price: price,
      quantity: quantity,
      rate: rate,
      subServiceType: subServiceType,
      vendor_id: user.id,
      name: name,
    );
    //sharedPrefrences
    emit(UpdateVendorServicesLoading());
    FirebaseFirestore.instance
        .collection('service')
        .doc(user.id)
        .update(model.toMap())
        .then((value) {
      emit(UpdateVendorServicesSucsses());
    }).catchError((er) {
      emit(UpdateVendorServicesError());

      print(er.toString());
    });
  }
}
