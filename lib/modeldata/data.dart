import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';


class TrackingBarcode{
  String?noref;
  String?lokasi;
  String?typetran;
  String?jum;
  String?jumlog;
  String?no_skau;
  String?tgl_doc;
  String?tgl_rec;

  TrackingBarcode({this.noref,this.lokasi,this.typetran,this.jum,this.jumlog,this.no_skau,this.tgl_doc,this.tgl_rec});
   
  factory TrackingBarcode.fromJson(Map<String,dynamic>json)
  {
    return TrackingBarcode(
      noref: json['noref'],
      lokasi: json['lokasi'],
      typetran: json['typetran'],
      jum: json['jum'],
      jumlog: json['jumlog'],
      no_skau: json['no_skau'],
      tgl_doc: json['tgl_doc'],
      tgl_rec: json['tgl_rec'],

      
      );
  }

}


class Log_Detail {
  String? LOG;
  String? HASILPOTONG;
  String? tglscan;
  String? tgl_sawmill;
  String? curskau2;
  String? kode_kayu;

  Log_Detail({this.LOG,this.HASILPOTONG,this.tglscan,this.tgl_sawmill,this.curskau2,this.kode_kayu});

  factory Log_Detail.fromJson(Map<String,dynamic>json)
  {
    return Log_Detail(
      LOG:json['LOG']?? '-',
      HASILPOTONG:json['HASILPOTONG']?? '-',
      tglscan:json['tglscan']?? '-',
      tgl_sawmill:json['tgl_sawmill']?? '-',
      curskau2:json['curskau2']?? '-',
      kode_kayu:json['kode_kayu'] ?? '-----'

    );
  }
  
}


class ListReviewBarcode{
  String?NO_SkAU;
  String?barcode;
  int?nourut;
  String?tgl_rec;
  int?NO_Log;
  String?nourutori;
  String?hit;

  ListReviewBarcode({this.NO_SkAU,this.barcode,this.nourut,this.tgl_rec,this.NO_Log,this.nourutori,this.hit});

  factory ListReviewBarcode.fromJson(Map<String,dynamic>json)
  {
    return ListReviewBarcode(
      NO_SkAU: json['NO_SKAU']??'',
      barcode: json['barcode']??'',
      nourut: json['nourut']??0,
      tgl_rec: json['tgl_rec']??'',
      NO_Log: json['NO_Log']??0,
      nourutori: json['nourutori']??'',
      hit: json['hit']??''
      );
  }


}

class BarcodeHilang{
  String? kode_kayu;
  String? barcodeheader;
  String? NO_SKAU;
  String? No_Log;
  String? P;
  String? L;
  String? T;
  String? qty;
  String? kw;
  String? no_papan;
  String? barcodepapan;
  String? ket;

  BarcodeHilang({this.kode_kayu,this.barcodeheader,this.NO_SKAU,this.No_Log,this.P,this.L,this.T,this.qty,this.kw,this.no_papan,this.barcodepapan,this.ket});

  factory BarcodeHilang.fromJson(Map<String,dynamic>json)
  {
    return BarcodeHilang(
        kode_kayu: json['kode_kayu']??'',
        barcodeheader: json['barcodeheader']??'',
        NO_SKAU: json['NO_SKAU']??'',
        No_Log: json['No_Log']??'',
        P: json['P']??'',
        L: json['L']??'',
        T: json['T']??'',
        qty: json['qty']??'',
        kw: json['kw']??'',
        no_papan: json['no_papan']??'',
        barcodepapan: json['barcodepapan']??'',
        ket: json['ket']??''
    );
  }
}