import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_catalog/models/bmw_model.dart';
import 'package:car_catalog/style.dart';
import 'package:flutter/widgets.dart';
import 'package:car_catalog/data/bmw_data.dart';

class DetailCarScreen extends StatefulWidget {
  final BMWModel bmwModel;

  DetailCarScreen({ this.bmwModel});

  @override
  _DetailCarScreenState createState() => _DetailCarScreenState();
}

// make a simple Form Widget with Flutter


class _DetailCarScreenState extends State<DetailCarScreen> {
  bool _favoriteState = false;

  void initState() {
    print('init state');
  }

  Widget mySnackBar({ String text,  Color color}) {
    return SnackBar(
      content: Text(text),
      backgroundColor: color,
      duration: Duration(seconds: 2),
      elevation: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.bmwModel.name,
      color: kPrimaryColor,
      theme: ThemeData(
          backgroundColor: kBackgroundColor,
          accentColor: kAccentColor,
          primaryColor: kPrimaryColor,
          fontFamily: 'Montserrat'),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  color: kPrimaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.chevron_left),
                              color: Colors.white,
                              iconSize: 36.0,
                            ),
                            Text('${widget.bmwModel.name}',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Builder(
                              builder: (context) => IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_favoriteState == false) {
                                      this._favoriteState = true;
                                      final snackBar = SnackBar(
                                        content: Text(
                                          '${widget.bmwModel.name} is Favorited!',
                                          style: TextStyle(fontSize: 20.0),
                                          textAlign: TextAlign.center,
                                        ),
                                        backgroundColor: kPrimaryColor,
                                        duration: Duration(seconds: 2),
                                        elevation: 5.0,
                                      );

                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      this._favoriteState = false;

                                      final snackBar = SnackBar(
                                        content: Text(
                                            '${widget.bmwModel.name} is Unavorited!',
                                            style: TextStyle(fontSize: 20.0),
                                            textAlign: TextAlign.center),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 2),
                                        elevation: 5.0,
                                      );

                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  });
                                },
                                icon: _favoriteState
                                    ? Icon(Icons.favorite)
                                    : Icon(Icons.favorite_border),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Image.network(widget.bmwModel.image,
                            fit: BoxFit.fitWidth, height: 170),
                        SizedBox(height: 30.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('POWER', style: kDetailPagePowerText),
                              //SizedBox(width: 70),
                              Text('0-100KM/H', style: kDetailPagePowerText),
                              //SizedBox(width: 50),
                              Text('MAX SPEED', style: kDetailPagePowerText)
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${widget.bmwModel.powerKW}Kw',
                                  style: kDetailPageBoldText),
                              //SizedBox(width: 70),
                              Text('${widget.bmwModel.speedToFull}SEC',
                                  style: kDetailPageBoldText),
                              //SizedBox(width: 90),
                              Text('${widget.bmwModel.topSpeed}*',
                                  style: kDetailPageBoldText)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bmwData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Image.network(
                          bmwData[index].image,
                          width: 70,
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 50,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    print('tes drive');
                  },
                  color: kPrimaryColor,
                  child: Text('Test Drive', style: kDetailPageBoldText),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}