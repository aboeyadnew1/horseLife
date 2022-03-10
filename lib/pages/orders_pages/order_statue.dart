import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:hourse_life/models/time_line_model.dart';
import 'package:search_choices/search_choices.dart';

class order_statue extends StatefulWidget {
  static String id="order_statue";
  const order_statue({Key key}) : super(key: key);

  @override
  _order_statueState createState() => _order_statueState();
}

class _order_statueState extends State<order_statue> {
  TextEditingController txt1_con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<TimeLineModel> data = [];
    data.add(new TimeLineModel(id: "1", name: "تحت الأجراء"));
    data.add(new TimeLineModel(id: "0", name: "جارى الشحن"));
    data.add(new TimeLineModel(id: "0", name: "تم الشحن"));
    data.add(new TimeLineModel(id: "0", name: "تم التوصيل"));


    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: () {
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil(Customers_home.id, (Route<dynamic> route) => false);
              },
            ),
            backgroundColor: Color.fromRGBO(100, 192, 229, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            title: new Text(
              "تتبع حالة الطلب",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Cairo',
                  color: Colors.white),
            ),
            actions: [Image.asset("images/horse.png",)],
          ),),
      body: Container(
        color: Colors.white,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),

              TimeLine(data: data),


            ],
          ),
        ),
      ),
    );
  }


}

class TimeLine extends StatefulWidget {
  final List<TimeLineModel> data;

  TimeLine({Key key,  this.data});


  @override
  _TimeLineState createState() => _TimeLineState(data);
}

class _TimeLineState extends State<TimeLine> {
  final List<TimeLineModel> data;

  _TimeLineState(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
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
                          height: 35,
                          color: Colors.black26,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (index == 3) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20.0)),
                                      //this right here
                                      child: Container(
                                        height: 220,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Text("تم توصيل طلبك بنجاح  ",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black),
                                              ),
                                              SizedBox(height: 15,),Text("من فضلك قم بتقييم المنتج ",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Cairo',
                                                    color: Colors.black),
                                              ),
                                              RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 35,
                                                itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              SizedBox(height: 15,),
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                padding: EdgeInsets.symmetric(horizontal: 15),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text('أرسل '),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Color.fromRGBO(72, 175, 218, 1),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(15),),
                                                    // fixedSize: Size(370.0, 40.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: data[index].id == "0"
                                    ? Colors.black26
                                    : Colors.blue,
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                data[index].id == "0" ?
                                Icons.circle
                                    : Icons.check_circle,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 2,
                          height: 35,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    Container(

                      child: Text(data[index].name),
                    )
                  ],
                ));
          }),
    );
  }
}
