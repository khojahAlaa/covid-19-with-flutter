import 'package:covid_19_api/widgets/continer.dart';
import 'package:flutter/material.dart';
import '../utils/styleConstant.dart';

class PreventationCard extends StatelessWidget {
  
  final String image;
  final String text;
  final String letter;
  const PreventationCard({
    Key key,
   
    this.image,
    this.text,
    this.letter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomContinerWidget(
      // containerHeight: 300,
      containerwidth: double.infinity,
      customWidget: Row(
        
        children: <Widget>[
         SizedBox(width: 10,),
          CircleAvatar(
                radius: 40.0,
                backgroundImage:
                    AssetImage(image ),
                backgroundColor:Colors.indigo[300],
              ),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(width: 50,),
              Text(
                letter,
               style: titleTextstyle.copyWith(color: recovercolor),
              ),
              const SizedBox(width: 10,),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
