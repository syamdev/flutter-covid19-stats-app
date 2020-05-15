import 'package:covid19_stats/config/env.dart';
import 'package:covid19_stats/model/covid19_cases.dart';
import 'package:covid19_stats/model/covid19_per_provinsi.dart';
import 'package:flutter/material.dart';

// TODO 08

class HomeContent extends StatefulWidget {
  final Covid19PerProvinsi covid19PerProvinsiId;

  const HomeContent({
    Key key,
    this.covid19PerProvinsiId,
  }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Covid19Cases> _listCovid19Cases;
  List<Datum> _listData;
    
  @override
  void initState() {
    _listCovid19Cases = <Covid19Cases>[
      Covid19Cases(
        title: "Positif",
        count: 0,
      ),
      Covid19Cases(
        title: "Sembuh",
        count: 0,
      ),
      Covid19Cases(
        title: "Meninggal",
        count: 0,
      ),
      Covid19Cases(
        title: "Perawatan",
        count: 0,
      ),
    ];
    _listData = widget.covid19PerProvinsiId.data;
    for (Datum data in _listData) {
      _listCovid19Cases[0].count += data.kasusPosi;
      _listCovid19Cases[1].count += data.kasusSemb;
      _listCovid19Cases[2].count += data.kasusMeni;
    }
    _listCovid19Cases[3].count = _listCovid19Cases[0].count;
    _listCovid19Cases[3].count -= _listCovid19Cases[1].count;
    _listCovid19Cases[3].count -= _listCovid19Cases[2].count;
    super.initState();
  }

  // TODO 10

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 512.0,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _itemGrid(index);
            },
            itemCount: _listCovid19Cases.length,
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(_listData[index].provinsi),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO 16
                    
                    Navigator.pushNamed(
                      context,
                      Env.detailRoute,
                      arguments: _listData[index],
                    );
                  },
                ),
              );
            },
            itemCount: _listData.length,
          ),
        ],
      ),
    );
  }

  // TODO 09

  Widget _itemGrid(int index) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(16.0),
      color: Colors.primaries[index],
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Center(
        child: ListView(
          primary: false,
          shrinkWrap: true,
          children: <Widget>[
            Text(
              "${_listCovid19Cases[index].title}",
              style: TextStyle(
                fontSize: 32.0,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "${_listCovid19Cases[index].count}",
              style: TextStyle(
                fontSize: 64.0,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

