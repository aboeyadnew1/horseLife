import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourse_life/constants/constants.dart';
import 'package:hourse_life/home_cubit/home_state.dart';
import 'package:hourse_life/models/service.dart';
import 'package:hourse_life/models/user.dart';
import 'package:image_picker/image_picker.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  UserModel userModel;
  void getVendorData() {
    emit(GetVendorLoading());
    FirebaseFirestore.instance
        .collection('Vendors')
        .doc('2022314132037551593')
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data());
      emit(GetVendorSucsses());
    }).catchError((er) {
      emit(GetVendorSucsses());

      print(er.toString());
    });
  }

  void updateVendorData({
    String id,
    String name,
    String phone,
    String email,
    String password,
    String recordNumber,
    String personalIdentity,
    String address,
    String job,
    String lat,
    String long,
    String image,
    String mainServiceType,
    String subServiceType,
  }) {
    UserModel model = UserModel(
      address: address,
      email: email,
      image: image,
      lat: lat,
      job: job,
      long: long,
      name: name,
      password: password,
      phone: phone,
      personalIdentity: personalIdentity,
      recordNumber: recordNumber,
    );
    emit(UpdateVendorLoading());

    FirebaseFirestore.instance
        .collection('Vendors')
        .doc('2022314132037551593')
        .update(model.toMap())
        .then((value) {
      emit(UpdateVendorSucsses());
    }).catchError((er) {
      emit(UpdateVendorError());

      print(er.toString());
    });
  }

  List<ServiceModel>services=[];
  ServiceModel serviceModel;
  void getVendorServices() {
    emit(GetVendorServicesLoading());
    FirebaseFirestore.instance
        .collection('service')
        .where("vendor_id",isEqualTo: uid)
        .get()
        .then((value) {
          value.docs.forEach((element) { 
           services.add(ServiceModel.fromJson(element.data())); 
          });
      emit(GetVendorServicesSucsses());
    }).catchError((er) {
      emit(GetVendorServicesSucsses());

      print(er.toString());
    });
  }

  void updateVendorServices({
    String vendor_id,
    String mainServiceType,
    String subServiceType,
    String name,
    String description,
    var quantity,
    var price,
    String deliveryMethod,
    String deliveryTime,
    String image,
    String id,
    var rate,
  }) {
    ServiceModel model = ServiceModel(
      deliveryMethod: deliveryMethod,
      deliveryTime: deliveryTime,
      description: description,
      image: image,
      mainServiceType: mainServiceType,
      name: name,
      price: price,
      quantity: quantity,
      rate: rate,
      subServiceType: subServiceType,
      vendor_id: uid,
    );
    emit(UpdateVendorServicesLoading());
    getVendorServices();
    FirebaseFirestore.instance
        .collection('service')
        .doc('1xPbO84whSfRgEAaeIYH')
        .update(model.toMap())
        .then((value) {
      emit(UpdateVendorServicesSucsses());
    }).catchError((er) {
      emit(UpdateVendorServicesError());

      print(er.toString());
    });
  }

  File imageServices;
  final picker = ImagePicker();
  Future setImageServices() async {
    emit(SetImageServicesSucsses());

    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageServices = File(image.path);
      emit(SetImageServicesSucsses());
    } else {
      print('no images');
    }
  }

  void storageImageServices({
    String vendor_id,
    String mainServiceType,
    String subServiceType,
    String name,
    String description,
    var quantity,
    var price,
    String deliveryMethod,
    String deliveryTime,
    String image,
    String id,
    var rate,
  }) {
    emit(StorageImageServicesLoading());
    FirebaseStorage.instance
        .ref()
        .child('services/${Uri.file(imageServices.path).pathSegments.last}')
        .putFile(imageServices)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateVendorServices(
          deliveryMethod: deliveryMethod,
          deliveryTime: deliveryTime,
          description: description,
          image: value,
          mainServiceType: mainServiceType,
          name: name,
          price: price,
          quantity: quantity,
          rate: rate,
          subServiceType: subServiceType,
        );
        emit(StorageImageServicesSucsses());
      }).catchError((er) {
        emit(StorageImageServicesError());

        print(er.toString());
      });
    }).catchError((er) {
      emit(SetImageServicesError());

      print(er.toString());
    });
  }

  File imageUser;
  Future setImageVender() async {
    emit(SetImageServicesSucsses());

    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageUser = File(image.path);
      emit(SetImageServicesSucsses());
    } else {
      print('no images');
    }
  }

  void storageImageVendor({
    String id,
    String name,
    String phone,
    String email,
    String password,
    String recordNumber,
    String personalIdentity,
    String address,
    String job,
    String lat,
    String long,
    String image,
    String mainServiceType,
    String subServiceType,
  }) {
    emit(StorageImageServicesLoading());
    FirebaseStorage.instance
        .ref()
        .child('services/${Uri.file(imageUser.path).pathSegments.last}')
        .putFile(imageUser)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateVendorData(
          image: value,
          mainServiceType: mainServiceType,
          name: name,
          address: address,
          email: email,
          job: job,
          lat: lat,
          long: long,
          password: password,
          phone: phone,
          personalIdentity: personalIdentity,
          recordNumber: recordNumber,
          subServiceType: subServiceType,
        );
        emit(StorageImageServicesSucsses());
      }).catchError((er) {
        emit(StorageImageServicesError());

        print(er.toString());
      });
    }).catchError((er) {
      emit(SetImageServicesError());

      print(er.toString());
    });
  }
}
