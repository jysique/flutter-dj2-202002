import 'package:flutter/material.dart';
import 'package:flutter_app/features/search_screen.dart';
import 'package:flutter_app/global/custom_color.dart';
import 'package:flutter_app/ui/item_button.dart';

class ChooseServiceScreen extends StatefulWidget {
  @override
  _ChooseServiceScreenState createState() => _ChooseServiceScreenState();
}

class _ChooseServiceScreenState extends State<ChooseServiceScreen> {
  String defaultService = "RENT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 50, right: 30),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Wrap(children: [
              Text(
                "I'M LOOKING ",
                style: TextStyle(
                    color: CustomColor.greyColor,
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "TO ",
                style: TextStyle(
                    color: CustomColor.greyColor,
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: DropdownButton(
                    value: defaultService,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "RENT",
                          style: TextStyle(
                              color: CustomColor.mainColor,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                        value: "RENT",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "BUY",
                          style: TextStyle(
                              color: CustomColor.mainColor,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        ),
                        value: "BUY",
                      ),
                    ],
                    onChanged: (value) {
                      defaultService = value;
                      setState(() {});
                    }),
              )
            ]),
          ),
          Positioned(
            child: ItemButton(
              width: 120,
              height: 45,
              textColor: Colors.white,
              buttonColor: CustomColor.mainColor,
              text: "Go",
              action: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>
                            SearchScreen(typeService: defaultService,)));
              },
            ),
            right: 60,
            bottom: 50,
          )
        ],
      ),
    )));
  }
}
