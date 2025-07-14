

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sawmill_tracking/message/msg.dart';
import 'package:sawmill_tracking/modeldata/data.dart';
import 'package:http/http.dart' as http;
import 'package:sawmill_tracking/provider/server.dart';


class Multidatas with ChangeNotifier {

  final box=GetStorage();

  List<TrackingBarcode> getTrackingBarcode=[];
  List<TrackingBarcode> get getGlobalTrackingBarcode=>getTrackingBarcode;

  Future <void> getDataTrackingBarcode(BuildContext context,String section) async{
    getTrackingBarcode.clear();

    var url=Uri.parse(NamaServer.server+'sawmill/trackingbarcode_section.php');
     final response= await http.post(url,
     body: {
      'section':section
     }
     
     ).timeout(Duration(seconds: 10)).catchError((error) {
    
  setMessage2("Server sedang sibuk/Koneksi internet terganggu,Mohon diclick process kembali",context);
  EasyLoading.dismiss();
});

final jsonwarn=jsonDecode(response.body);
if (jsonwarn['errormsg']=='Tidak ada data')
{
    setMessage2("Tidak ada data", context);
      EasyLoading.dismiss();
       notifyListeners();
}


  final json=jsonDecode(response.body)['data'] as List;
 
  final newdata=json.map((a)=>TrackingBarcode.fromJson(a)).toList();
 print (newdata);
  getTrackingBarcode=newdata;
  notifyListeners();
  EasyLoading.dismiss();


  }


  List<Log_Detail> getLOgDetail= [];
  List<Log_Detail> get getgloballogdetail =>getLOgDetail;


  Future <void> ListBarcPutri(BuildContext context) async{

   getLOgDetail.clear();

  var url=Uri.parse(NamaServer.server+'sawmill/listbarcputri.php');
  final response =await http.post(url
  ).timeout(Duration(seconds: 10)).catchError((error) {
    
  setMessage2("Server sedang sibuk/Koneksi internet terganggu,Mohon diclick process kembali",context);
  EasyLoading.dismiss();
});

  // print(response.body);
 final jsonwarn=jsonDecode(response.body);
     if (jsonwarn['errormsg']=='Tidak ada data')
     {
      setMessage2("Tidak ada data", context);
      EasyLoading.dismiss();
       notifyListeners();
     }

   
      final json = jsonDecode(response.body)["data"] as List;
      
      final newdata=json.map((a)=>Log_Detail.fromJson(a)).toList();
      getLOgDetail=newdata;
   
  
  notifyListeners();
  EasyLoading.dismiss();
  
  }

  List<ListReviewBarcode> getListReviewDetail=[];
  List<ListReviewBarcode> get getGlobalListReview =>getListReviewDetail;


  Future <void> ListReviewFuture(String noskau,BuildContext context) async{
     
     var url=Uri.parse(NamaServer.server+'sawmill/listreviewbarcodephp_flutter.php');
     final response=await http.post(url,
     body: {
      'noskau':noskau
     }
     
     ).timeout(Duration(seconds: 10)).catchError((error){
      setMessage2("Server sedang sibuk/Koneksi internet terganggu,Mohon diclick process kembali", context);
      EasyLoading.dismiss();
       notifyListeners();
     });


final jsonwarn=jsonDecode(response.body);
     if (jsonwarn['errormsg']=='Tidak ada data')
     {
      setMessage2("Tidak ada data", context);
      EasyLoading.dismiss();
       notifyListeners();
     }


    // print(response.body);

     final json=jsonDecode(response.body)['data'] as List;
     final newdata=json.map((e)=>ListReviewBarcode.fromJson(e)).toList();
     getListReviewDetail=newdata;
     notifyListeners();
     EasyLoading.dismiss();
  }


  List<BarcodeHilang> getBarcodeHilang =[];
  List<BarcodeHilang> get getGlobalBarcodeHIlang=>getBarcodeHilang;

  Future <void> cariBarcodeHilang(String kodekayu,String nourut,BuildContext context) async{
    getBarcodeHilang.clear();
    var url=Uri.parse(NamaServer.server+'sawmill/caribarcodehilang.php');
    final response=await http.post(
        url,
        body: {
            'kodekayu':kodekayu,
            'nourut':nourut
        }
    ).timeout(Duration(seconds: 10)).catchError((error){
           setMessage2("Server sedang sibuk/Koneksi internet terganggu,Mohon diclick process kembali", context);
      EasyLoading.dismiss();
    });
   
     
     final jsonwarn=jsonDecode(response.body);
     if (jsonwarn['errormsg']=='Tidak ada data')
     {
      setMessage2("Tidak ada data", context);
      EasyLoading.dismiss();
       notifyListeners();
     }

    print(jsonwarn);


    final json=jsonDecode(response.body)['data'] as List;
    
    final newData=json.map((a)=>BarcodeHilang.fromJson(a)).toList();
    getBarcodeHilang=newData;
    notifyListeners();
    EasyLoading.dismiss();
      
  }





   List<BarcodeHilang> getCariBarcodepapan =[];
  List<BarcodeHilang> get getGlobalCariBarcodepapan=>getCariBarcodepapan;

  Future <void> cariBarcode_papan(String barcode,String p,String l,String t,BuildContext context) async{
    getCariBarcodepapan.clear();
    var url=Uri.parse(NamaServer.server+'sawmill/caribarcode_papan.php');
    final response=await http.post(
        url,
        body: {
            'barcode':barcode,
            'p':p,
            'l':l,
            't':t
            
        }
    ).timeout(Duration(seconds: 10)).catchError((error){
           setMessage2("Server sedang sibuk/Koneksi internet terganggu,Mohon diclick process kembali", context);
      EasyLoading.dismiss();
    });
    
     
     final jsonwarn=jsonDecode(response.body);
   
   
      if (jsonwarn['errormsg']=='Tidak ada data')
     {
      setMessage2("Tidak ada data", context);
      box.write("jumbarcode", '0');
      EasyLoading.dismiss();
       notifyListeners();
     }else
    {
    box.write("jumbarcode", jsonwarn['jumbarcode']);
    }

print(jsonwarn);


    final json=jsonDecode(response.body)['data'] as List;
    
    final newData=json.map((a)=>BarcodeHilang.fromJson(a)).toList();
    getCariBarcodepapan=newData;
    notifyListeners();
    EasyLoading.dismiss();
  }
}