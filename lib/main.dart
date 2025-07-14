import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sawmill_tracking/form/barcodehilang.dart';
import 'package:sawmill_tracking/form/jumlahbarcode.dart';
import 'package:sawmill_tracking/form/listbarcputri.dart';
import 'package:sawmill_tracking/form/reviewpapan.dart';
import 'package:sawmill_tracking/form/scanbarcode.dart';
import 'package:sawmill_tracking/message/msg.dart';
import 'package:sawmill_tracking/provider/multidatas.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

void main() {
 //runApp(const MainApp());
 runApp(
   MultiProvider(providers: [
    ChangeNotifierProvider.value(value: Multidatas())
   ],
   child: MainApp(),
   )
   
 );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home:  homeapp(),
     
    );
  }
}

class homeapp extends StatefulWidget {
  const homeapp({super.key});

  @override
  State<homeapp> createState() => _homeappState();
}

class _homeappState extends State<homeapp> {

Future<void> dataHeader(String company,String tgl) async {
    String barcodeScanRes;
      try {
      barcodeScanRes = await FlutterBarcodeScanner.dataHeader(
           company,tgl);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

   
  }


  Future<void> ambilHasil(String jumlah,String barcode) async {
    String barcodeScanRes;
      try {
      barcodeScanRes = await FlutterBarcodeScanner.ambilHasil(
           jumlah,barcode);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    // setState(() {
    //   _scanBarcode = barcodeScanRes;
    //   _jumlah=1;
    // });
  }


getSession() async{
    await GetStorage.init();
   // box.erase();
   
   } 

  Future<void> scanBarcodeNormalBarcode() async {
    String barcodeScanRes;
        try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff0000", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
        
        // Provider.of<Alldata>(context,listen: false).Insert_PR_Manual_Barcode(context, barcodeScanRes,_prno_temp.text, _tglpr.text, txttampung_dept!, box.read('u_name'))
        // .then((value) => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => 
        // PurchaseRequest_form(tipe: tipe, pr_no: _prno_temp.text, dept_pr: txttampung_dept.toString(), tgl_pr: _tglpr.text)
        // ,))
        // );
       
        
        // getRefresh_isipr(); 
     setMessage2(barcodeScanRes, context);
       
    //     setState(() {
    //  // _barcodecode.text = barcodeScanRes;
    //   //_jumlah=1;
    // });
    
    // if (barcodeScanRes.isNotEmpty )
    // {

    //   if (barcodeScanRes!='-1')
    //    {
    // Future.delayed(Duration(milliseconds: 500),(){
    //     ambilHasil(_jumlah.toString(),_scanBarcode);
    //   scanBarcodeNormal();
    //      });

       //dataHeader
      


    //    setState(() {
    //   _barcodecode.text = barcodeScanRes;
    //   _jumlah++;
    // }
    //);

    //    }
    // }
    
   
  }


  @override
  void initState() {
    getSession();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(title: Text("Tracking Barcode Versi 3.5"),),
      body:
      Padding(padding: EdgeInsets.all(5),
      child: 
       Column(
        children: [

         MouseRegion( 
          cursor: SystemMouseCursors.click,
          
         child:
         GestureDetector(
          onTap: () {
            EasyLoading.show(status: 'Processing');
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListBarcPutri(),));
          },
          child: 
         buttonText('List LOG VS Papan','m1.png')
         )),

        SizedBox(height: 5,),

MouseRegion( 
          cursor: SystemMouseCursors.click,
          
         child:
         GestureDetector(
          onTap: () {
            EasyLoading.show(status: 'Processing');
            Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPapan(),));
          },
          child: 
         buttonText('Review Hasil Papan','m2.png')
         )),

SizedBox(height: 5,),

MouseRegion( 
          cursor: SystemMouseCursors.click,
          
         child:
         GestureDetector(
          onTap: () {
            
            Navigator.push(context, MaterialPageRoute(builder: (context) => BarcodeHilang()),);
          },
          child: 
         buttonText('Cari Barcode Hilang','m3.png')
         )),

         SizedBox(height: 5,),   
         
          MouseRegion( 
          cursor: SystemMouseCursors.click,
          
         child:
         GestureDetector(
          onTap: () async {
        
               Navigator.push(context, MaterialPageRoute(builder: (context) => ScanBarcodeTrack()),);
          },



          child: 
         buttonText('Scan Barcode by ukuran','m4.png')
         )),

          SizedBox(height: 5,),   
         
          MouseRegion( 
          cursor: SystemMouseCursors.click,
          
         child:
         GestureDetector(
          onTap: () async {
        
               Navigator.push(context, MaterialPageRoute(builder: (context) => JumlahBarcodeSection()),);
          },



          child: 
         buttonText('Jumlah Barcode By Section','m4.png')
         )),
        ],
      ),
      )
    );
  }

Widget buttonText(String msg,String img){
  return
  
  Container(
    padding: EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.black
    ),
    child: 
  Row(
      
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5)

                  ),
                  child: 
                Image.asset('assets/images/$img',height: 20,width: 20,),
                ),
                SizedBox(width: 5,),
                Expanded(child: Text(msg,style: TextStyle(color: Colors.white),)),
                SizedBox(
                  width: 50,
                  child: Icon(Icons.arrow_right,color: Colors.white,),
                )
              ]
  )
  ); 
}

}