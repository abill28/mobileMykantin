// To parse this JSON data, do
//
//     final hutang = hutangFromJson(jsonString);

import 'dart:convert';

Hutang hutangFromJson(String str) => Hutang.fromJson(json.decode(str));

String hutangToJson(Hutang data) => json.encode(data.toJson());

class Hutang {
    String status;
    String msg;
    List<Datum> data;

    Hutang({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory Hutang.fromJson(Map<String, dynamic> json) => Hutang(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int idHutang;
    String namaPenghutang;
    int jumlahHutang;

    Datum({
        required this.id,
        required this.idHutang,
        required this.namaPenghutang,
        required this.jumlahHutang,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idHutang: json["idHutang"],
        namaPenghutang: json["namaPenghutang"],
        jumlahHutang: json["jumlahHutang"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idHutang": idHutang,
        "namaPenghutang": namaPenghutang,
        "jumlahHutang": jumlahHutang,
    };
}
