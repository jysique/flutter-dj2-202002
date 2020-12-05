import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global/custom_color.dart';
import 'package:flutter_app/model/car.dart';

class ItemInfoCar extends StatefulWidget {
  final Car car;
  final ValueChanged<Car> goDetails;
  final ValueChanged<Car> goService;
  const ItemInfoCar({Key key, this.car,this.goDetails,this.goService}) : super(key: key);

  @override
  _ItemInfoCar createState() => _ItemInfoCar();
}

class _ItemInfoCar extends State<ItemInfoCar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          margin: EdgeInsets.only(left: 50, right: 20),
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(widget.car.name),
                        Text(widget.car.price.toString())
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(widget.car.brand), Text("/day")],
                    ),
                  ],
                ),
              )),
              Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            widget.car.stars.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "(${widget.car.opinion})",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if(widget.goDetails!=null){
                                widget.goDetails(widget.car);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.26,
                              child: Text(
                                "Details",
                                style: TextStyle(color: CustomColor.mainColor),
                              ),
                            ),
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if(widget.goService!=null){
                                widget.goService(widget.car);
                              }

                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(25.0)),
                                color: CustomColor.mainColor,
                              ),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.26,
                              child: Text(
                                "Rent",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
          decoration: BoxDecoration(
              color: CustomColor.greyCar,
              borderRadius: BorderRadius.circular(20)),
          height: 400,
        ),
        Positioned(
          top: 80,
          child: Image(image: AssetImage('assets/images/pngfind 8.png')),
        ),
      ],
    );
  }
}
