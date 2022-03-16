// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hourse_life/home_cubit/home_cubit.dart';
import 'package:hourse_life/home_cubit/home_state.dart';
import 'package:hourse_life/pages/complaints%20_page.dart';

class Products extends StatefulWidget {
  const Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..getVendorServices()..getVendorData(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, stat) {},
          builder: (context, stat) {
            HomeCubit cubit = HomeCubit.get(context);
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 70,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => Complaints()));
                    },
                  ),
                  backgroundColor: const Color.fromRGBO(100, 192, 229, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  title: new Text(
                    'المنتجات',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Cairo',
                        color: Colors.white),
                  ),
                ),
                body: cubit.serviceModel != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SafeArea(
                          child: SingleChildScrollView(
                            child: Center(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  const SizedBox(
                                    height: 29.0,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                          width: 200,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color.fromRGBO(
                                                  72, 175, 218, 1),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Image.network(
                                              '${cubit.serviceModel.image}',
                                          fit: BoxFit.cover,
                                          ),

                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      Container(
                                        width: 300,
                                        height: 220,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                72, 175, 218, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 20.0,
                                              ),
                                              Row(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  const Text(
                                                    'اسم المنتج :',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                      '${HomeCubit.get(context).serviceModel.name}'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'المخزون المتبقي :',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                      '${HomeCubit.get(context).serviceModel.quantity}'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'السعر :',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                      '${HomeCubit.get(context).serviceModel.price}'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'عدد الطلبات على المنتج :',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                      '${HomeCubit.get(context).serviceModel.deliveryMethod}'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'تقييم العملاء للمنتج :',
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                      '${HomeCubit.get(context).serviceModel.rate}'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            );
          }),
    );
  }
}
