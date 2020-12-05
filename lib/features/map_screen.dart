import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/global/custom_color.dart';
import 'package:flutter_app/model/car.dart';
import 'package:flutter_app/ui/item_hot_car.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  List<Car> cars;
  CameraPosition initialPos = CameraPosition(
    target: LatLng(-12.104061, -76.962902),
    zoom: 19,
  );

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
    getPosition();
  }

  Map<String, Marker> markers = {};
  Position position;

  void getPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    initialPos = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 19,
    );
    List<LatLng> positionsList = new List<LatLng>();
    positionsList.add(initialPos.target);
    positionsList.add(new LatLng(-12.055623817645479, -77.08433839575153));
    positionsList.add(new LatLng(-11.975535, -77.060665));
    for (int i = 0; i < positionsList.length; i++) {
      markers[i.toString()] = new Marker(
          markerId: MarkerId(i.toString()),
          position: positionsList[i],
          onTap: () {
            print("hola");
          });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: position != null
            ? Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: initialPos,
                    markers: markers.values.toSet(),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 45,
                        margin: EdgeInsets.only(bottom: 10),
                        height: 45,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                  ),
                  DraggableScrollableSheet(initialChildSize: 0.3, builder: (BuildContext context, ScrollController scrollController){
                    return SingleChildScrollView(
                      controller: scrollController,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: ListView.builder(
                                itemCount: cars.length,
                                physics: new NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  return ItemHotCar(car: cars[i]);
                                }),
                          )

                        );
                  })
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    ));
  }
}
