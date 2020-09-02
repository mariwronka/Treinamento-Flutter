import 'package:flutter/material.dart';

class ItemColumn extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  ItemColumn({
    this.icon,
    this.iconColor,
    this.title,
    this.description,
  })  : assert(icon != null),
        assert(iconColor != null),
        assert(title != null),
        assert(description != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: iconColor, borderRadius: BorderRadius.circular(20)),
            height: 40,
            width: 40,
            child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                Container(
                  width: 270,
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
