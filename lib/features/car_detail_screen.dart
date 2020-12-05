import 'package:flutter/material.dart';
import 'package:flutter_app/global/custom_color.dart';
import 'package:flutter_app/model/car.dart';

class CarDetailScreen extends StatefulWidget {
  final Car car;

  const CarDetailScreen({Key key, this.car}) : super(key: key);
  @override
  _CarDetailScreenState createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  int frame = 1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    margin: EdgeInsets.only(bottom: 10),
                    height: 40,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColor.mainColor),
                  ),
                  Column(
                    children: [
                      Text(widget.car.name),
                      Row(
                        children: [
                          Text(widget.car.brand),
                          Icon(Icons.star, color: Colors.yellow),
                          Text(widget.car.stars.toString()),
                          Text("(${widget.car.opinion})")
                        ],
                      )
                    ],
                  ),
                  Image(image: AssetImage('assets/images/logocar.png')),
                ],
              ),

              GestureDetector(
                onTap: (){
                  frame = frame == 3?1:frame +1;

                  setState(() {

                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/images/car$frame.png'),
                  ),
                )
              ),
              Container(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/rotate.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
