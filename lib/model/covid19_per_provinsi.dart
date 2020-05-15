// TODO 04 : generate JSON to Dart (https://app.quicktype.io/)
// To parse this JSON data, do
//
//     final covid19PerProvinsi = covid19PerProvinsiFromJson(jsonString);

import 'dart:convert';

class Covid19PerProvinsi {
    List<Datum> data;

    Covid19PerProvinsi({
        this.data,
    });

    factory Covid19PerProvinsi.fromJson(String str) => Covid19PerProvinsi.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Covid19PerProvinsi.fromMap(Map<String, dynamic> json) => Covid19PerProvinsi(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Datum {
    int fid;
    int kodeProvi;
    String provinsi;
    int kasusPosi;
    int kasusSemb;
    int kasusMeni;

    Datum({
        this.fid,
        this.kodeProvi,
        this.provinsi,
        this.kasusPosi,
        this.kasusSemb,
        this.kasusMeni,
    });

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        fid: json["fid"] == null ? null : json["fid"],
        kodeProvi: json["kodeProvi"] == null ? null : json["kodeProvi"],
        provinsi: json["provinsi"] == null ? null : json["provinsi"],
        kasusPosi: json["kasusPosi"] == null ? null : json["kasusPosi"],
        kasusSemb: json["kasusSemb"] == null ? null : json["kasusSemb"],
        kasusMeni: json["kasusMeni"] == null ? null : json["kasusMeni"],
    );

    Map<String, dynamic> toMap() => {
        "fid": fid == null ? null : fid,
        "kodeProvi": kodeProvi == null ? null : kodeProvi,
        "provinsi": provinsi == null ? null : provinsi,
        "kasusPosi": kasusPosi == null ? null : kasusPosi,
        "kasusSemb": kasusSemb == null ? null : kasusSemb,
        "kasusMeni": kasusMeni == null ? null : kasusMeni,
    };
}
