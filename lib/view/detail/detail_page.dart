import 'package:covid19_stats/config/env.dart';
import 'package:covid19_stats/model/covid19_per_provinsi.dart';
import 'package:covid19_stats/view/detail/detail_content.dart';
import 'package:flutter/material.dart';

// TODO 11

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ChartsType _chartsType;

  @override
  void initState() {
    _chartsType = ChartsType.BAR;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Datum _data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(_data?.provinsi ?? ""),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cached),
            onPressed: () {
              _chartsType = _chartsType == ChartsType.BAR
                ? ChartsType.PIE
                : ChartsType.BAR;
              setState(() {});
            },
          ),
        ],
      ),
      
      // TODO 15

      body: Card(
        margin: const EdgeInsets.all(16.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: DetailContent(
            data: _data,
            chartsType: _chartsType,
          ),
        ),
      ),
    );
  }
}