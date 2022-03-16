import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
      body: Stack(
        children: <Widget>[dashBg, content],
        ),
      ), viewModelBuilder: () => HomeViewModel(),
    );
  }

  get dashBg => Column(
    children: <Widget>[
      Expanded(
        child: Container(color: Colors.blue),
        flex: 2,
      ),
      Expanded(
        child: Container(color: Colors.transparent),
        flex: 5,
      ),
    ],
  );

  get content => Container(
    child: Column(
      children: <Widget>[
        header,
        grid,
      ],
    ),
  );

  get header => const ListTile(
    contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
    title: Text(
      'Dashboard',
      style: TextStyle(color: Colors.white),
    ),
    subtitle: Text(
      '4 Items',
      style: TextStyle(color: Colors.white),
    ),
    trailing: CircleAvatar(),
  );

  get grid => Expanded(
    child: Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GridView.count(
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: .90,
        children: List.generate(4, (_) {
          return Card(
            elevation: 2,
            color: Color(0xe6f0f0f0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[FlutterLogo(), Text('data')],
              ),
            ),
          );
        }),
      ),
    ),
  );
}