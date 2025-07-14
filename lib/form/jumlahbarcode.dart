import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sawmill_tracking/form/jumlahbarcode_oth.dart';
import 'package:sawmill_tracking/form/jumlahbarcode_sw.dart';

class JumlahBarcodeSection extends StatefulWidget {
  const JumlahBarcodeSection({super.key});

  @override
  State<JumlahBarcodeSection> createState() => _JumlahBarcodeSectionState();
}

class _JumlahBarcodeSectionState extends State<JumlahBarcodeSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tracking Jumlah Barcode",style: TextStyle(fontSize: 16),),),
      body: Column(
        children: [
          
          GestureDetector(
            child: 
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(child: 
                  Text("Sawmill/papan ",style: TextStyle(color: Colors.white,fontSize: 20),)
                ),
                SizedBox(
                  width: 50,
                  child:   Icon(Icons.arrow_right,color: Colors.white,size: 35,)),
                
              ],
            ),
            
          ),
          onTap: () {
                EasyLoading.show(status: "Processing..");
            Navigator.push(context, MaterialPageRoute(builder: (context) => JumlahBarcode_SW(judul: "Sawmill"),));
          },
          ),

//Warehoue
           
          GestureDetector(
            child: 
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(child: 
                  Text("Warehouse ",style: TextStyle(color: Colors.white,fontSize: 20),)
                ),
                SizedBox(
                  width: 50,
                  child:   Icon(Icons.arrow_right,color: Colors.white,size: 35,)),
                
              ],
            ),
            
          ),
            onTap: () {
                 EasyLoading.show(status: "Processing..");
             Navigator.push(context, MaterialPageRoute(builder: (context) => JumlahBarcode_OTH(judul: "Warehouse", section: 'wrh'),));
          },
          ),


//Oven
           
          GestureDetector(
            child: 
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(child: 
                  Text("Oven ",style: TextStyle(color: Colors.white,fontSize: 20),)
                ),
                SizedBox(
                  width: 50,
                  child:   Icon(Icons.arrow_right,color: Colors.white,size: 35,)),
                
              ],
            ),
            
          ),
          onTap: () {
                EasyLoading.show(status: "Processing..");
               Navigator.push(context, MaterialPageRoute(builder: (context) => JumlahBarcode_OTH(judul: "Oven", section: 'oven'),));
          },
          ) ,



          //Factory
           
          GestureDetector(
            child: 
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(child: 
                  Text("Factory ",style: TextStyle(color: Colors.white,fontSize: 20),)
                ),
                SizedBox(
                  width: 50,
                  child:   Icon(Icons.arrow_right,color: Colors.white,size: 35,)),
                
              ],
            ),
            
          ),
          onTap: () {
              EasyLoading.show(status: "Processing..");
              Navigator.push(context, MaterialPageRoute(builder: (context) => JumlahBarcode_OTH(judul: "Factory", section: 'fact'),));
          },
          ) ,

           //Factory
           
          GestureDetector(
            child: 
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5)
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(child: 
                  Text("Sawmill Out ",style: TextStyle(color: Colors.white,fontSize: 20),)
                ),
                SizedBox(
                  width: 50,
                  child:   Icon(Icons.arrow_right,color: Colors.white,size: 35,)),
                
              ],
            ),
            
          ),
          onTap: () {
              EasyLoading.show(status: "Processing..");
              Navigator.push(context, MaterialPageRoute(builder: (context) => JumlahBarcode_OTH(judul: "Sawmill Out", section: 'swout'),));
          },
          )              
        ],
      ),
    );
  }
}