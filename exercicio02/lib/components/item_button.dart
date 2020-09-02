import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  final Color color;
  final String title;

  ItemButton({
    this.color,
    this.title,
  })  : assert(color != null),
        assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RaisedButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          color: color,
          onPressed: () {},
        ),
      ),
    );
  }
}
