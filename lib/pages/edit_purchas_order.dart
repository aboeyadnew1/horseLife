import 'package:flutter/material.dart';
import 'package:hourse_life/models/time_line_model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timelines/timelines.dart';

class EditPurchaseOrders extends StatefulWidget {
  @override
  _EditPurchaseOrdersState createState() => _EditPurchaseOrdersState();
}

class _EditPurchaseOrdersState extends State<EditPurchaseOrders> {
  TextEditingController search_con = TextEditingController();

  @override
  Widget build(BuildContext context) {

    List<TimeLineModel> data=[];
    data.add(new TimeLineModel(id: "1",name: "تحت الأجراء"));
    data.add(new TimeLineModel(id: "1",name: "جارى الشحن"));
    data.add(new TimeLineModel(id: "0",name: "تم الشحن"));
    data.add(new TimeLineModel(id: "0",name: "تم التوصيل"));


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 149,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(100, 192, 229, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: new Text(
          ' تعديل حالة الطلب',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Cairo',
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      controller: search_con,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "بحث عن الطلب",
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(72, 175, 218, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(72, 175, 218, 1),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //first section
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'رقم الطلب',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'اسم العميل',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'الكمية',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'العنوان :',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'السعر ',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'بتاريخ ',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'مواعيد الاستلام ',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //End offirst section
                                //Start  of Second Section of Card
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 55.0),
                                    width: 103.0,
                                    height: 90.0,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(100, 192, 229, 1),
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: Color.fromRGBO(72, 175, 218, 1),
                                      ),
                                    ),
                                  ),
                                ),
                                //End of Second Section of Card
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      child: Text(
                                        'تعديل حالة الطلب ',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {
                                        showMaterialModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              SingleChildScrollView(
                                                controller:
                                                ModalScrollController.of(
                                                    context),
                                                child: Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                        2.5,
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                    child: Column(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            'تتبع الطلب  ',
                                                            style: TextStyle(
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                          ),
                                                        ),
                                                        Container(

                                                          child: TimeLine(data: data,),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Color.fromRGBO(
                                                72, 175, 218, 1)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      child: Text(
                                        'الغاء الطلب',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color:
                                            Color.fromRGBO(72, 175, 218, 1),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimeLine extends StatefulWidget {
  final List<TimeLineModel> data;
  TimeLine({Key key,@required this.data});


  @override
  _TimeLineState createState() => _TimeLineState(data);
}

class _TimeLineState extends State<TimeLine> {
  final List<TimeLineModel> data;
  _TimeLineState(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 2,
                          height: 10,
                          color: Colors.black26,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color:  data[index].id=="0"?Colors.black26:Colors.green,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              data[index].id=="0"?
                              Icons.circle
                                  :Icons.check_circle,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 10,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    Container(

                      child:Text(data[index].name),
                    )
                  ],
                ));
          }),
    );
  }
}
