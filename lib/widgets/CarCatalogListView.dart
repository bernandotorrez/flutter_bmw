import 'package:flutter/material.dart';
import 'package:car_catalog/data/bmw_data.dart';
import 'package:line_icons/line_icons.dart';
import 'package:car_catalog/style.dart';
import 'package:car_catalog/screens/detail_car_screen.dart';

class CarCatalogListView extends StatefulWidget {
  final int tabIndex;

  CarCatalogListView({ this.tabIndex});

  @override
  _CarCatalogListViewState createState() => _CarCatalogListViewState();
}

class _CarCatalogListViewState extends State<CarCatalogListView> {
  @override
  Widget build(BuildContext context) {
    if (widget.tabIndex == 0) {
      return SedanCarCatalogListView();
    } else if (widget.tabIndex == 1) {
      return CombiCarCatalogListView();
    } else if (widget.tabIndex == 2) {
      return CabrioCarCatalogListView();
    } else if (widget.tabIndex == 3) {
      return SUVCarCatalogListView();
    }

    return SedanCarCatalogListView();
  }
}

class SedanCarCatalogListView extends StatefulWidget {
  @override
  _SedanCarCatalogListViewState createState() =>
      _SedanCarCatalogListViewState();
}

class _SedanCarCatalogListViewState extends State<SedanCarCatalogListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 448.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: bmwData.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print(bmwData[index].name);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailCarScreen(bmwModel: bmwData[index]);
                  }));
                },
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      color: Colors.white,
                      elevation: 0.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Text(bmwData[index].name, style: kCardtitle),
                          Image.network(bmwData[index].image,
                              width: 350.0, height: 250.0),
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0)),
                                color: kBackgroundCardColor),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(LineIcons.cog, color: kBlackColor),
                                  Text(
                                      '${bmwData[index].powerKW.toString()} KW',
                                      style: kCardDetail),
                                  SizedBox(width: 20.0),
                                  Icon(LineIcons.flash, color: kBlackColor),
                                  Text(
                                      '${bmwData[index].speedToFull.toString()} Sec',
                                      style: kCardDetail),
                                  SizedBox(width: 20.0),
                                  Icon(Icons.av_timer, color: kBlackColor),
                                  Text(
                                      '${bmwData[index].topSpeed.toString()} *',
                                      style: kCardDetail),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
    ;
  }
}

class CombiCarCatalogListView extends StatefulWidget {
  @override
  _CombiCarCatalogListViewState createState() =>
      _CombiCarCatalogListViewState();
}

class _CombiCarCatalogListViewState extends State<CombiCarCatalogListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text('Combi'),
    );
  }
}

class CabrioCarCatalogListView extends StatefulWidget {
  @override
  _CabrioCarCatalogListViewState createState() =>
      _CabrioCarCatalogListViewState();
}

class _CabrioCarCatalogListViewState extends State<CabrioCarCatalogListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text('Cabrio'),
    );
  }
}

class SUVCarCatalogListView extends StatefulWidget {
  @override
  _SUVCarCatalogListViewState createState() => _SUVCarCatalogListViewState();
}

class _SUVCarCatalogListViewState extends State<SUVCarCatalogListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text('SUV'),
    );
  }
}
