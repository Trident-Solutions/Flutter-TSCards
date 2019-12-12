import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_payment_card/Model/RawData.dart';
import 'package:flutter_payment_card/External/constant.dart';


class CardPayment extends StatefulWidget {
  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {

  int _current = 0;

  final Text titleText =  new Text(
    CommonText.paymentOption,
    style: new TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.w400
    ),
    textAlign: TextAlign.left,
  );

  @override

  Widget build(BuildContext context) {

    return new Scaffold(

        backgroundColor: Colors.white,

        body: new SafeArea(

            top: true,

            child: new Column (

              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[

                titleText,

                CarouselSlider(
                  aspectRatio: 16/9,
                  viewportFraction: 0.85,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  height: 250.0,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                      print(index);
                    });
                  },
                  items: [0,1,2,3].map((index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            margin: EdgeInsets.all(5.0),
                            child: homeUI(index)
                        );
                      },
                    );
                  }).toList(),
                )

              ],
            )

        )
    );
  }

  Widget homeUI(index) {

    final BoxDecoration boxDecoration = new BoxDecoration(
      shape: BoxShape.rectangle,
      color: RawData().cardList[index].backColor.withOpacity(1.0) ,
      image: new DecorationImage(
        image: new AssetImage(
            AppImages.backPattern
        ),
        fit: BoxFit.cover,),
      borderRadius: new BorderRadius.all(
          const Radius.circular(10)
      ),
    );

    final Container cardName =  new Container(
      width: (MediaQuery.of(context).size.width - 188), //left 20 +  right 20 // Image 65 //space 10 // 50 Carousel Side
      child: new Text(
          RawData().cardList[index].cardName.toString(),
          textAlign: TextAlign.left,
          style: new TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
      ),
    );

    final Image cardImage  = new Image(
      image: new AssetImage( RawData().cardList[index].cardImage),
      width: 65, height: 65,
      fit: BoxFit.scaleDown, alignment: Alignment.centerRight,
    );

    final Container startText =  new Container(
      child:new Text(
          CommonText.starText,textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          )
      ),
      height: 50,
      width: (MediaQuery.of(context).size.width - 170), //left 10 +  right 10 // cardNo 100 //space 1 // 50 Carousel Side
      padding:new EdgeInsets.only(top: 5,bottom: 5),);

    final Container cardNumber = new Container(
      height:40,
      child:  new Text(
          RawData().cardList[index].cardNumber.toString(),textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          )
      ),
    );

    final Container cardHolderName =  new Container(
      width: (MediaQuery.of(context).size.width - 190), //left 20 +  right 20 // expDate 90 //space 10 // 50 Carousel Side
      child: new Text(
          RawData().cardList[index].cardHolderName.toString(),
          textAlign: TextAlign.left,
          style: new TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          )
      ),
    );

    final Container expDate =  new Container(
      width: 70, //left 20 +  right 20 // Image 65 //space 10 // 50 Carousel Side
      child:  new Text(
          RawData().cardList[index].expDate.toString(),
          textAlign: TextAlign.right,
          style: new TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          )
      ),
    );


    return new  Container(

      margin: EdgeInsets.only(top: 20,),

      height: 250, decoration: boxDecoration,

      width: MediaQuery.of(context).size.width - 50,

      child:  new Column(

          crossAxisAlignment: CrossAxisAlignment.center,

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[

            new Row(

              crossAxisAlignment: CrossAxisAlignment.center,

              mainAxisAlignment: MainAxisAlignment.start,


              children: <Widget>[

                new Padding(padding: EdgeInsets.only(left: 20)),

                cardName,

                new Padding(padding: EdgeInsets.only(right: 10)),

                cardImage,

                new Padding(padding: EdgeInsets.only(right: 20)),

              ],

            ),

            new Row(

              crossAxisAlignment: CrossAxisAlignment.center,

              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[

                new Padding(padding: EdgeInsets.only(left: 10)),

                startText,

                cardNumber,

                new Padding(padding: EdgeInsets.only(right: 10)),

              ],
            ),

            new Row(

              crossAxisAlignment: CrossAxisAlignment.center,

              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[

                new Padding(padding: EdgeInsets.only(left: 20)),

                cardHolderName,

                expDate,

                new Padding(padding: EdgeInsets.only(right: 20)),

              ],
            ),

          ]

      ),

    );
  }

}