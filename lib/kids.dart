import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class kids extends StatefulWidget {

  @override
  State<kids> createState() => _kidsState();
}

class _kidsState extends State<kids> {
  Map <String , bool> score = {};
  Map <String , Color > choice = {
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
    // 'think Allah' :Image(image: AssetImage('assets/images/mo.png')) ,
    // 'male' : Image(image: AssetImage('assets/images/male.png')) ,
    // 'female' : Image(image: AssetImage('assets/images/male.png')),
    // 'mo' : Image(image: AssetImage('assets/images/male.png')) ,
      };

  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
floatingActionButton: FloatingActionButton(child: Icon(Icons.refresh) , onPressed: () {
  setState(() {
    score.clear();
    index ++ ;

  });
},),
      appBar: AppBar(title: Text('your Score:  ')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center,
              children:choice.keys.map((element) { SizedBox(height:  20.0,);
                return Expanded(child:

                 Draggable<String>(data:element
                    ,child:move(score[element]==true ? '  ': element ),
                    feedback:CircularProgressIndicator() ,
                    childWhenDragging: move('Goo')));
              }).toList(),),
          ),
          Expanded(

            child: Container(height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center,
                  children:choice.keys.map((element){
                    return buildTarget(element);
                  }).toList()..shuffle(Random(index)),),
              ),
            ),
          )

        ]),
      ),

    );
  }

  Widget buildTarget(element){ return
    DragTarget<String> (builder: (context, candidateData, rejectedData){
    if(score[element] == true){
      return Container(color: Colors.white,alignment: Alignment.center,width: 200 , height: 50,
        child:
      Text('Congratulation !', style:  TextStyle(fontSize: 15.0 , color: Colors.amber , fontWeight: FontWeight.bold),),);
    }
    else {return Container(color: choice[element], width: 200.0 , height: 50.0,);}},
      onWillAccept:(data) => data == element ,
        onAccept:(data) {
      setState(() {score[element] = true ;print('Bravoo');});},
    onLeave: (data) {},);
  }
}
// class move extends StatelessWidget {
// late String emoji ;
// move(this.emoji) ;
// Widget build(BuildContext context) {
//     return Material(
// color: Colors.transparent,
//       child: Container( width: double.infinity , height: 30 ,alignment: Alignment.center ,child:
//       Text(emoji , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold),)),
//     );

//   }
// }
 Widget move (mo ){ return Column( mainAxisAlignment: MainAxisAlignment.center,
   children: [
     Text(mo , style: TextStyle(fontSize: 25.0 , fontWeight: FontWeight.bold , color: Colors.blue)),
     // Text('goo' , style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.w600 , color: Colors.green))
   ],
 );}





