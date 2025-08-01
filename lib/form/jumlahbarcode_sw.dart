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
   
    Future getDatabarcode() async{
        Provider.of<Multidatas>(context,listen: false).getDataTrackingBarcode(context, "papan");
    }

    Future onRefresh() async {
  Provider.of<Multidatas>(context,listen: false).ListBarcPutri(context);
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
          SingleChildScrollView(
            
            child: 
           Container(
            height: MediaQuery.of(context).size.height/1.2,
            child:  
          RefreshIndicator(onRefresh: getDatabarcode,
          child: 
          FutureBuilder(future: getDatabarcode(), builder: (context, snapshot) {
            if (snapshot.connectionState==ConnectionState.waiting)
            {
              return CircularProgressIndicator();
            }else
            {
            return  Consumer<Multidatas>(builder: (context, provx, child) {
            return ListView.builder(
              itemCount: provx.getGlobalTrackingBarcode.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                   //lokasi
                    Expanded(child:
                     Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(style: BorderStyle.solid,color: Colors.white)
                      ),
                      margin: EdgeInsets.only(right: 1,left: 1),
                      padding: EdgeInsets.only(top: 5,bottom: 5,left: 1,right: 1),
                      child: 
                     Text(provx.getGlobalTrackingBarcode[i].lokasi!,style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center)
                     )
                     ),

                      //Papan
                    Expanded(child:
                     Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(style: BorderStyle.solid,color: Colors.white)
                      ),
                      margin: EdgeInsets.only(right: 1 ),
                      padding: EdgeInsets.only(top: 5,bottom: 5,left: 1,right: 1),
                      child: 
                     Text(provx.getGlobalTrackingBarcode[i].jum!.toString(),style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center)
                     )
                     ),

                      //log
                    Expanded(child:
                     Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(style: BorderStyle.solid,color: Colors.white)
                      ),
                      margin: EdgeInsets.only(right: 1 ),
                      padding: EdgeInsets.only(top: 5,bottom: 5,left: 1,right: 1),
                      child: 
                     Text(provx.getGlobalTrackingBarcode[i].jumlog!.toString(),style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center,)
                     )
                     ),

                         //skau
                    Expanded(child:
                     Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(style: BorderStyle.solid,color: Colors.white)
                      ),
                      margin: EdgeInsets.only(right: 1 ),
                      padding: EdgeInsets.only(top: 5,bottom: 5,left: 1,right: 1),
                      child: 
                     Text(provx.getGlobalTrackingBarcode[i].no_skau!.toString(),style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center,)
                     )
                     ),
                       //skau
                    Expanded(child:
                     Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(style: BorderStyle.solid,color: Colors.white)
                      ),
                      margin: EdgeInsets.only(right: 1 ),
                      padding: EdgeInsets.only(top: 5,bottom: 5,left: 1,right: 1),
                      child: 
                     Text(provx.getGlobalTrackingBarcode[i].tgl_rec.toString(),style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center,)
                     )
                     ),
                  ],
                );
              
            },);
          },);
            }
          },)
          
         
           
          ),
          ))
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
              color: Colors.blue,
              border: Border.all(style: BorderStyle.solid)
            ),
            child: Text(nama,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),)
          );
  }
}