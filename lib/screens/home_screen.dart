import 'package:flutter/material.dart';
import 'package:car_catalog/style.dart';
import 'package:car_catalog/widgets/CarCatalogListView.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> carModel = ['Sedan', 'Combi', 'Cabrio', 'SUV', 'MPV'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 70.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset('assets/images/bmw_logo.jpg', height: 25.0, width: 25.0),
                    Text('BMW Indonesia', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        print('Menu');
                      },
                        child: Icon(Icons.menu, color: kPrimaryColor)
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 70.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Text('All Models', style: kHeaderText),
              ),
            ),
            Container(
              height: 70.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: carModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)
                        ),
                        textColor: index == selectedIndex ? Colors.white : kBlackColor,
                        elevation: 0.0,
                        color: index == selectedIndex ? kPrimaryColor : Colors.white,
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(carModel[index], style: kCarModelList(index, selectedIndex)),
                      ),
                    );
                  },
                ),
              ),
            ),
            CarCatalogListView(tabIndex: selectedIndex),
          ],
        ),
      ),
    );
  }
}



