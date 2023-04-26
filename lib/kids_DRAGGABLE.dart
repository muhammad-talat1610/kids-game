import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KidsReview extends StatefulWidget {
   KidsReview({Key? key}) : super(key: key);

  @override
  State<KidsReview> createState() => _KidsReviewState();
}

class _KidsReviewState extends State<KidsReview> {
  Map  <String , bool>score  = {} ;
  int index = 0;

  Map  <String , Color>choices = {
    'blue' : Colors.blue ,
    'red' : Colors.red ,
    'yellow' : Colors.yellow ,
    'green' : Colors.green ,
    'pink' : Colors.pink,
    'black' : Colors.black87,
    'orange' : Colors.orange,
    'cyan' : Colors.cyanAccent,
    'purple' : Colors.purple,
    'grey' : Colors.grey,
    'lightGreen' : Colors.lightGreen ,
    'teal' : Colors.teal ,
    'brown' : Colors.brown ,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.refresh), onPressed: () {
        setState(() {
     index -- ;
        });
      },),

      appBar:AppBar(title: Text('Your Score : '),),
      body:Row(children: [
        Expanded(
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center,

            children:choices.keys.map((e){

              return Draggable(data : e , child:move(score[e] == true ? ' ': e ), feedback:Text(e) ,childWhenDragging:Text('go'),);
            }).toList()
            ,),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center,
                 children:choices.keys.map((e){
                   return dragTarget(e);

                 }).toList()..shuffle(Random(index))),
          ),
        ),

      ]) ,

    );


  }
  Widget dragTarget (e)
  { return DragTarget( builder: (context, candidateData, rejectedData){
      if(score[e] == true){ return Container(alignment: Alignment.center ,width: 200 , height: 60,child: Text('Congratulation !!'),);
      }else{return Container(color: choices[e],alignment: Alignment.center ,width: 200 , height: 60);}
      },
      onLeave:(data) { score[e] =false ; print('tried again') ;},
      onAccept: (data){setState(() {score[e] = true ; print('Brave') ;});},
      onWillAccept: (data)=>data == e,);
  }
}

Widget move( emoji){
  return Text(emoji , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold ,),);
}
