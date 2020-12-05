import 'package:flutter/material.dart';
import 'package:flutter_app/global/custom_color.dart';

class ItemButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback action;
  final Color textColor;
  final Color buttonColor;
 const ItemButton({Key key, this.width, this.height, this.text, this.action,
   this.textColor = Colors.white,
   this.buttonColor = Colors.black}): super(key:key);

 @override
  _ItemButton createState()=> _ItemButton();
}

class _ItemButton extends State<ItemButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        if(widget.action !=null){
          widget.action();
        }
      },
      child: Container(
        width: widget.width,
        margin: EdgeInsets.only(bottom: 10),
        height: widget.height,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
              child:
                Text(widget.text,
                    style: TextStyle(color: widget.textColor, fontSize: 18)),
            ),
            Positioned(
              right: 5,
              top: 10,
              child: Icon(Icons.arrow_forward, color: Colors.white,),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

}