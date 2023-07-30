import 'package:flutter/material.dart';
class Quotes extends StatelessWidget {
  final String quote;
  final String author;
  final int index;
  final Function deleteQuote;
 const Quotes({super.key, required this.quote,required this.author,required this.index,required this.deleteQuote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0) ,
      margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child:Column(
        children: [


          Text(quote,textDirection: TextDirection.rtl,style:const TextStyle(fontFamily: "Cairo",fontSize: 20.0,color: Colors.black,),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                deleteQuote(index);
              }, icon:const  Icon(Icons.remove_circle,size: 25.0,color: Colors.redAccent,)),

              Row(mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(author,textDirection: TextDirection.rtl,style:const TextStyle(fontFamily: "Cairo",fontSize: 15.0,color: Colors.blue,),),
                const Icon(Icons.arrow_back_ios_new,color: Colors.blue,size: 15.0,),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
