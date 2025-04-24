import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:sawmill_tracking/message/msg.dart';
import 'package:sawmill_tracking/provider/multidatas.dart';
import 'package:flutter/services.dart';

class BarcodeHilang extends StatefulWidget {
  const BarcodeHilang({super.key});

  @override
  State<BarcodeHilang> createState() => _BarcodeHilangState();
}

class _BarcodeHilangState extends State<BarcodeHilang> {

   final _TextKodeKayu=TextEditingController();
   final _TextNourut=TextEditingController();
   final _TextBarcode=TextEditingController();
   final String copycopy="";
   
   @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<Multidatas>(context,listen: false).cariBarcodeHilang(_TextKodeKayu.text, _TextNourut.text, context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Barcode Hilang"),),
      body: Padding(padding: EdgeInsets.all(5),
      child: Container(

        padding: EdgeInsets.all(5),
         
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Column(children: [
          TextFormField(
            controller: _TextKodeKayu,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(

              hintText: "Ketik Kode Kayu",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid)
              )
            ),
          ),
          SizedBox(height: 5,),

          TextFormField(
            controller: _TextNourut,
            style: TextStyle(color:Colors.black),
            decoration: InputDecoration(

              hintText: "Ketik Nomor urut papan/tengah",
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid)
              )
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () async{
            EasyLoading.show(status: "Processing");
            await Provider.of<Multidatas>(context,listen: false).cariBarcodeHilang(_TextKodeKayu.text, _TextNourut.text, context);
          }, child: Text("Process")),



          SizedBox(height: 5,),

          Row(
            children: [
                 Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("Barcode",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
                      SizedBox(width: 2,),
                         Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("P",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
                         Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("L",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
                         Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("T",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
                         Expanded(child: Container(
                         padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text("LOG",style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center,),
                      )),
  
  
  
  
  

            ],
          ),
          
          SingleChildScrollView(
            child: 
            Container(
              height: MediaQuery.of(context).size.height/3,
              child: 
          Consumer<Multidatas>(builder: (context, provx, child) {
            return ListView.builder(
              itemCount: provx.getGlobalBarcodeHIlang.length,
              itemBuilder: (context, i) {
                return  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   
                 
                      Expanded(child: 
                     GestureDetector(
                   child: 
                  
                      Container(
                        height: 45,
                         padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalBarcodeHIlang[i].barcodepapan!,style: TextStyle(fontSize: 8,color: Colors.yellow,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      ),
                      
                      onTap: () async{
                       
                      final String textToCopy = provx.getGlobalBarcodeHIlang[i].barcodepapan!;
               if (textToCopy.isNotEmpty) {
                  Clipboard.setData(ClipboardData(text: textToCopy));
                // setMessage2("Test", context);
                  try {
                    await Clipboard.setData(ClipboardData(text: textToCopy));
                    // setMessage2("test", context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(provx.getGlobalBarcodeHIlang[i].barcodepapan!+ '  Copied',textAlign: TextAlign.center,),
                      behavior: SnackBarBehavior.floating,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 10,right: 10,bottom: MediaQuery.of(context).size.height-250),
                      
                      ),
                      
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to copy to clipboard.'),
                      
                      ),
                      
                    );
                  }
               }
                     },
                   ),
                     
                  ),
              
 
                            
                      SizedBox(width: 2,),
                    
                          Expanded(child: Container(
                            height: 45,
                             padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalBarcodeHIlang[i].P!,style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center),
                      )),
                           Expanded(child: Container(
                            height: 45,
                             padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalBarcodeHIlang[i].L!,style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center),
                      )),
                           Expanded(child: Container(
                            height: 45,
                              padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalBarcodeHIlang[i].T!,style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center),
                      )),
                        Expanded(child: Container(
                          
                              padding: EdgeInsets.only(top: 10,bottom: 10,left: 2,right: 2),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(style: BorderStyle.solid,color: Colors.white)
                        ),
                        child: Text(provx.getGlobalBarcodeHIlang[i].kode_kayu!+' / '+provx.getGlobalBarcodeHIlang[i].barcodeheader!,style: TextStyle(fontSize: 8,color: Colors.white),textAlign: TextAlign.center),
                      ))

                  ],
                );
            },);
          },)),
            
          )
        ],),
      ),
      ),
    );
  }
}