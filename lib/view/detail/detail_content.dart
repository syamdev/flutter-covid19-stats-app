import 'package:charts_flutter/flutter.dart';
import 'package:covid19_stats/config/env.dart';
import 'package:covid19_stats/model/covid19_cases.dart';
import 'package:covid19_stats/model/covid19_per_provinsi.dart';
import 'package:flutter/material.dart';

// TODO 12

class DetailContent extends StatefulWidget {
  final Datum data;
  final ChartsType chartsType;

  const DetailContent({
    Key key,
    this.data,
    this.chartsType,
  }) : super(key: key);

  @override
  _DetailContentState createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  // TODO 13

  List<Covid19Cases> _listCases;
  List<Series<Covid19Cases, String>> _listSeries;

  @override
  void initState() {
    _listCases = <Covid19Cases>[
      Covid19Cases(
        title: "Positif",
        count: widget.data.kasusPosi,
      ),
      Covid19Cases(
        title: "Sembuh",
        count: widget.data.kasusSemb,
      ),
      Covid19Cases(
        title: "Meninggal",
        count: widget.data.kasusMeni,
      ),
    ];
    _listSeries = <Series<Covid19Cases, String>>[
      Series(
        id: widget.data.provinsi,
        data: _listCases,
        domainFn: (Covid19Cases cases, int index) {
          return cases.title;
        },
        measureFn: (Covid19Cases cases, int index) {
          return cases.count;
        },
        labelAccessorFn: (Covid19Cases cases, int index) {
          return "${cases.count}";
        },
      ),
    ];
    super.initState();
  }
  
  // TODO 14
  @override
  Widget build(BuildContext context) {
    return widget.chartsType == ChartsType.BAR
        ? BarChart(
            _listSeries,
            barRendererDecorator: BarLabelDecorator<String>(
              labelPosition: BarLabelPosition.outside,
            ),
          )
        : PieChart(
            _listSeries,
            defaultRenderer: ArcRendererConfig(
              arcRendererDecorators: [
                ArcLabelDecorator(
                  labelPosition: ArcLabelPosition.outside,
                ),
              ],
            ),
            behaviors: [
              DatumLegend(),
            ],
          );
  }
}