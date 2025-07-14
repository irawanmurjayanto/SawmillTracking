import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sawmill_tracking/provider/multidatas.dart';

class JumlahBarcode_OTH extends StatefulWidget {
  final String judul;
  final String section;
  const JumlahBarcode_OTH({Key?key,required this.judul,required this.section}):super(key: key);



  @override
  State<JumlahBarcode_OTH> createState() => _JumlahBarcode_SWState(judul:judul,section:section);
}

class _JumlahBarcode_SWState extends State<JumlahBarcode_OTH> {

   final String judul;
    final String section;
   _JumlahBarcode_SWState({required this.judul,required this.section});
   
    Future getDatabarcode() async{
        Provider.of<Multidatas>(context,listen: false).getDataTrackingBarcode(context, section);
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
            
            Widget_Header(section=='swout'?"Tujuan":"Type"),
            
            Widget_Header("jum"),
            Widget_Header("Tgl Doc."),
            Widget_Header("Tgl Upload."),
            

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
                     Text(provx.getGlobalTrackingBarcode[i].typetran.toString(),style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center)
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
                     Text(provx.getGlobalTrackingBarcode[i].jum!.toString(),style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center,)
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
                     Text(provx.getGlobalTrackingBarcode[i].tgl_doc!.toString(),style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center,)
                     )
                     ),
                       //skau
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
                     Text(provx.getGlobalTrackingBarcode[i].tgl_rec!.toString(),style: TextStyle(fontSize: 6,color: Colors.white),textAlign: TextAlign.center,)
                     )
                     ),
                       //skau
                  
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
            child: Text(nama,style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),)
          );
  }
}