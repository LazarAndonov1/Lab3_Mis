import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';




import '../model/list_item.dart';
import 'adaptive_flat_button.dart';

class NovElement extends StatefulWidget {
  final Function addItem;

  NovElement(this.addItem);
  @override
  State<StatefulWidget> createState() => _NovElementState();
}

class _NovElementState extends State<NovElement> {
  final _naslovController = TextEditingController();
  final _datumController = TextEditingController();
  final _vremeController = TextEditingController();

  late String naslov;
  late String datum;
  late String vreme;

  void _submitData(){
    if (_naslovController.text.isEmpty) {
      return;
    }
    final vnesenNaslov = _naslovController.text;
    final vnesenDatum = _datumController.text;
    final vnesenoVreme = _vremeController.text;

    if (vnesenNaslov.isEmpty || vnesenDatum .isEmpty || vnesenoVreme.isEmpty) {
      return;
    }

    final newItem = ListItem(id: nanoid(5), naslov: vnesenNaslov, datum: vnesenDatum, vreme: vnesenoVreme);
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: _naslovController,
            decoration: InputDecoration(labelText: "Vnesete ime na predmetot:"),
            onSubmitted: (_) => _submitData(),

          ),
          TextField(
            controller: _datumController,
            decoration: InputDecoration(labelText: "Vnesete datum na polaganje:"),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _vremeController,
            decoration: InputDecoration(labelText: "Vnesete vreme na polaganje:"),
            onSubmitted: (_) => _submitData(),
          ),
          AdaptiveFlatButton("Dodaj", _submitData)
        ],
      ),
    );
  }
}