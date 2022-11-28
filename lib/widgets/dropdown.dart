import 'package:flutter/material.dart';
import 'package:hebrewbear/data/dataprovider.dart';

const items = DBtypes;
class HebrewBearDropdown extends StatefulWidget {

  const HebrewBearDropdown({super.key, required this.onChanged, required this.defaultItem, required this.listItems});

  final Function onChanged;
  final String defaultItem;
  final List<String> listItems;

  @override
  State<HebrewBearDropdown> createState() => _HebrewBearDropdownState(defaultItem);
}
//read<WordsListNotifier>().words.length
class _HebrewBearDropdownState extends State<HebrewBearDropdown> {
  
  String dropDownValue;
  _HebrewBearDropdownState(this.dropDownValue);
  
  @override
  Widget build(BuildContext context) {

    //final int length = items.length;
    final int length = widget.listItems.length;

    return Container(
      child: DropdownButtonFormField<String>(
        value: dropDownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        //dropdownColor: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        focusColor: Colors.transparent,
        //style: const TextStyle(color: Colors.black),
        items: [
          ...List.generate(length, (index) => DropdownMenuItem<String>(
            // value: items[index],
            // child: Text(items[index]),
            value: widget.listItems[index],
            child: Text(widget.listItems[index]),
          ))
        ],
        onChanged: (String? newValue) => {
          setState(() {
            dropDownValue = newValue!;
            widget.onChanged(newValue);
          })
        },
        ),
    );
  }
}