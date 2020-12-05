import 'package:flutter/material.dart';
import 'package:flutter_app/features/car_detail_screen.dart';
import 'package:flutter_app/features/payment_screen.dart';
import 'package:flutter_app/global/custom_color.dart';
import 'package:flutter_app/model/car.dart';
import 'package:flutter_app/ui/item_hot_car.dart';
import 'package:flutter_app/ui/item_info_car.dart';

import 'map_screen.dart';

class SearchScreen extends StatefulWidget {
  final String typeService;

  SearchScreen({this.typeService});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Car> cars;
  TextEditingController searchController = new TextEditingController();
  bool showResults = false;

  @override
  void initState() {
    cars = new List<Car>();
    cars.add(new Car(
        name: "Alpha Speed",
        brand: "Aston Martin 0",
        price: 320.0,
        stars: 5.0,
        opinion: 20));
    cars.add(new Car(
        name: "Beta Speed",
        brand: "Aston Martin 1",
        price: 330.0,
        stars: 4.0,
        opinion: 10));
    cars.add(new Car(
        name: "Gamma Speed",
        brand: "Aston Martin 3",
        price: 330.0,
        stars: 3.0,
        opinion: 18));
    cars.add(new Car(
        name: "Theta Speed",
        brand: "Aston Martin 2",
        price: 320.0,
        stars: 5.0,
        opinion: 20));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.typeService);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 10, top: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Image(
                        width: 50,
                        image: AssetImage("assets/images/picture.png")),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.location_on_outlined),
                          Expanded(
                              child: TextField(
                            controller: searchController,
                            onChanged: (text) {
                              showResults = searchController.text.trim() != "";
                              setState(() {});
                            },
                            maxLines: 1,
                            maxLength: 200,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              counterText: "",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          )),
                          showResults
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MapScreen()));
                                  },
                                  child: Text("View map"),
                                )
                              : Container(),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: CustomColor.greyColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
                !showResults
                    ? Container(
                        child: Column(
                          children: [
                            Image(
                                image: AssetImage(
                                    "assets/images/icon_voucher.png")),
                            Text("No Location",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text("Please enter your location",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            height: 300,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cars.length,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return ItemInfoCar(
                                    car: cars[i],
                                    goService: (index) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PaymentScreen(),
                                          )
                                      );
                                    },
                                    goDetails: (index) {
                                      //Navigator.push(
                                      //    context,
                                      //    MaterialPageRoute(
                                      //        builder: (context) => CarDetailScreen()));
                                    },
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hot deals",
                                style: TextStyle(color: CustomColor.blackCar),
                              ),
                              Text(
                                "View all",
                                style: TextStyle(color: CustomColor.blueCar),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: ListView.builder(
                                itemCount: cars.length,
                                physics: new NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return ItemHotCar(car: cars[i],goDetail: (car){
                                    //Navigator.push(context,MaterialPageRoute(
                                    //    builder: (context) => CarDetailScreen()
                                    //));
                                  },);
                                }),
                          )
                        ],
                      ),
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
