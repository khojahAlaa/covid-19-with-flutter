import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/styleConstant.dart';
import '../secreens/Menu.dart';


class ClipHeader extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const ClipHeader(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);
  @override
  _ClipHeaderState createState() => _ClipHeaderState();
}

class _ClipHeaderState extends State<ClipHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        width: double.infinity,
        height: 280,
        decoration: BoxDecoration(
          // border: BoxBorder(),
          gradient: LinearGradient(
            colors: [
              Colors.indigo[400],
              Colors.indigo[300],
              // cardColor,
            ],
            // begin: Alignment.topRight,

            end: Alignment.centerRight,
          ),
          image: 
          DecorationImage(
            image:  AssetImage("assets/images/virus2.png", ),
            // colorFilter: ColorFilter.linearToSrgbGamma(),
            
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed(Menu.routeName);
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.upToDown,
                    child: Menu(),
                  ),
                );
              },
              child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
             SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    child: 
                  
                    SvgPicture.asset(
                      widget.image,
                      width: 280,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                    // Image.asset( widget.image,),
                  ),
                  Positioned(
                    // top: 10 ,
                    //  top: 10 - widget.offset / 2,
                    // - widget.offset / 2,
                    left: 150 - widget.offset / 2 ,
                    bottom: 35 - widget.offset / 2,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: headingTextStyle.copyWith(
                        color: Colors.white,
                        backgroundColor: Colors.amber[700].withOpacity(0.5),
                      ),
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
