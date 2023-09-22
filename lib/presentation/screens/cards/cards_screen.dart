import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = <Map<String, dynamic>>[
      {"title":"Card title","label": "Card elevation 0", "elevation": 0.0},
      {"title":"Card title","label": "Card elevation 1", "elevation": 1.0},
      {"title":"Card title","label": "Card elevation 2", "elevation": 2.0},
      {"title":"Card title","label": "Card elevation 3", "elevation": 3.0},
      {"title":"Card title","label": "Card elevation 4", "elevation": 4.0},
      {"title":"Card title","label": "Card elevation 5", "elevation": 5.0},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...cards.map((card) =>
                _CardType1(title: card["title"],label: card["label"], elevation: card["elevation"])),
            ...cards.map((card) =>
                _CardType2(title: card["title"],label: card["label"], elevation: card["elevation"])),
            ...cards.map((card) =>
                _CardType3(title: card["title"],label: card["label"], elevation: card["elevation"])), ...cards.map((card) =>
                _CardType4(title: card["title"],label: card["label"], elevation: card["elevation"])),
          ],
        ),
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String title;
  final String label;
  final double elevation;

  const _CardType1({super.key, required this.label, required this.elevation, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(padding: const EdgeInsets.fromLTRB(15,0,0,10), child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Expanded(child: Text(title)),
            IconButton(iconSize: 20,icon: Icon(Icons.more_vert_outlined), onPressed: (){},),
          ],),
          // Padding(
          //   padding: const EdgeInsets.only(right:15,top: 0, bottom: 20),
          //   child: Divider(height:0 ,color: Colors.black,thickness: 0.2),
          // ),
          SizedBox(height: 10,),


          Align(alignment: Alignment.topLeft, child: Text(label),),
          ],
      )),
    );
  }
}


class _CardType2 extends StatelessWidget {
  final String title;
  final String label;
  final double elevation;

  const _CardType2({super.key, required this.label, required this.elevation, required this.title});

  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),side: BorderSide(color:colors.primary , )),
      elevation: elevation,
      child: Padding(padding: const EdgeInsets.fromLTRB(15,0,0,10), child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(title)),
              IconButton(iconSize: 20,icon: Icon(Icons.more_vert_outlined), onPressed: (){},),
            ],),
          SizedBox(height: 10,),
          Align(alignment: Alignment.topLeft, child: Text("$label + Border Radius"),),
        ],
      )),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String title;
  final String label;
  final double elevation;

  const _CardType3({super.key, required this.label, required this.elevation, required this.title});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(padding: const EdgeInsets.fromLTRB(15,0,0,10), child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(title)),
              IconButton(iconSize: 20,icon: Icon(Icons.more_vert_outlined), onPressed: (){},),
            ],),
          // Padding(
          //   padding: const EdgeInsets.only(right:15,top: 0, bottom: 20),
          //   child: Divider(height:0 ,color: Colors.black,thickness: 0.2),
          // ),
          SizedBox(height: 10,),


          Align(alignment: Alignment.topLeft, child: Text("Card with color- $label"),),
        ],
      )),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String title;
  final String label;
  final double elevation;

  const _CardType4({super.key, required this.label, required this.elevation, required this.title});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network("https://picsum.photos/id/${elevation.toInt()}/600/350",height: 350, fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text(title, style: TextStyle(backgroundColor: Colors.black87, color: Colors.white))),
                Container(
                    decoration:BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)), color: Colors.white),child: IconButton(iconSize: 20,icon: Icon(Icons.more_vert_outlined), onPressed: (){},)),
              ],),
          ),
          SizedBox(height: 10,),


          Positioned(bottom:10, left:15,right:0,child:  Text("Card with color- $label",style: TextStyle(backgroundColor: Colors.black87, color: Colors.white),)),
        ],
      ),
    );
  }
}
