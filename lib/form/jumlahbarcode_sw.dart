import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sawmill_tracking/provider/multidatas.dart';

class JumlahBarcode_SW extends StatefulWidget {
  final String judul;
  const JumlahBarcode_SW({Key?key,required this.judul}):super(key: key);



  @override
  State<JumlahBarcode_SW> createState() => _JumlahBarcode_SWState(judul:judul);
}

class _JumlahBarcode_SWState extends State<JumlahBarcode_SW> {

   final String judul;
   _JumlahBarcode_SWState({required this.judul});
   
    getDatabarcode() async{
      await Provider.of<Multidatas>(context,listen: false).getDataTrackingBarcode(context, "papan");
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul),),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Widget_Header("Lokasi"),
            Widget_Header("Papan"),
            Widget_Header("Log"),
            Widget_Header("SKAU"),
            Widget_Header("Tgl"),

            ]
          ),
          RefreshIndicator(onRefresh: getDatabarcode(),
          child: Consumer<Multidatas>(builder: (context, provx, child) {
            return ListView.builder(
              itemCount: provx.getGlobalTrackingBarcode.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Expanded(child:
                     Container(
                      margin: EdgeInsets.only(right: 1,left: 1),
                      padding: EdgeInsets.all(2),
                      child: 
                     Text(provx.getGlobalTrackingBarcode[1].lokasi!)
                     )
                     )
                  ],
                );
              
            },);
          },)!
           
          ),
        ],
      ),
    );
  }


  Widget_Header(String nama){
    return 
    Expanded(child: 
          Container(
            margin: EdgeInsets.only(right: 1,left: 1),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(style: BorderStyle.solid)
            ),
            child: Text(nama,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),)
          );
  }
}