import 'package:covid19_stats/model/covid19_per_provinsi.dart';
import 'package:covid19_stats/network/api_client.dart';
import 'package:covid19_stats/view/home/home_content.dart';
import 'package:flutter/material.dart';

// TODO 07 : create HomePage class with StatelessWidget
//            fill build with Scaffold

class HomePage extends StatelessWidget {
  // TODO 17

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistik Covid-19 di Indonesia"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<Covid19PerProvinsi>(
          future: ApiClient.getCovid19PerProvinsiId(),
          builder: (
            BuildContext context,
            AsyncSnapshot<Covid19PerProvinsi> snapshot,
          ) {
            if (snapshot.hasData) {
              return HomeContent(
                covid19PerProvinsiId: snapshot.data,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}