import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global/custom_color.dart';
import 'package:flutter_app/model/car.dart';

class ItemHotCar extends StatefulWidget {
  final Car car;
  final ValueChanged<Car> goDetail;
  const ItemHotCar({Key key, this.car,this.goDetail}) : super(key: key);

  @override
  _ItemHotCar createState() => _ItemHotCar();
}

class _ItemHotCar extends State<ItemHotCar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(widget.goDetail != null){
          widget.goDetail(widget.car);
        }
      },
      child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 50),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          color: CustomColor.greyCar,
                          borderRadius: BorderRadius.circular(20))),
                  Positioned(
                    top: 80,
                    child:
                        Image(image: AssetImage('assets/images/pngfind 8.png')),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        child: Text(widget.car.brand, maxLines: 2),
                      ),
                      Text(widget.car.price.toString()),
                    ],
                  ),
                  Text(widget.car.name),
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    widget.car.stars.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
