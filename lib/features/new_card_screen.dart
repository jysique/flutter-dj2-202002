import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/global/custom_color.dart';

class NewCardScreen extends StatefulWidget {
  @override
  _NewCardScreenState createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  static Widget mainColor = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    color: CustomColor.mainColor,
  );

  String cardNumber = "";
  String cvv = "";
  bool showBackSide = false;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  FocusNode focusNodeCardNumber = FocusNode();
  FocusNode focusNodeCvv = FocusNode();
@override
  void initState() {
    // TODO: implement initState
  focusNodeCvv.addListener(() {
    if(focusNodeCvv.hasFocus){
      showBackSide = true;
    }else{
      showBackSide = false;
    }
    setState(() {

    });
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CreditCard(
                    cardHolderName: "CHUPETIN",
                    cardExpiry: "10/25",
                    cardNumber: cardNumber,
                    cvv: cvv,
                    showShadow: true,
                    showBackSide: showBackSide,
                    bankName: "BANK BANK",
                    frontBackground: _NewCardScreenState.mainColor,
                    backBackground: CardBackgrounds.white),
                SizedBox(
                  height: 20,
                ),
                TextField(
//                  controller: cardNumberController,
                  focusNode: focusNodeCardNumber,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,

                  maxLength: 16,

                  decoration: InputDecoration(
                    counterText: "",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  focusNode: focusNodeCvv,
                  //                controller: cvvController,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 4,

                  decoration: InputDecoration(
                    counterText: "",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
