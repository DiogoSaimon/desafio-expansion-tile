import 'package:flutter/material.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  const CustomExpansionTileWidget({
    Key? key,
    required this.title,
    this.children = const <Widget>[],
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  _CustomExpansionTileWidgetState createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                color: isClicked ? Colors.blue : null,
              ),
            ),
            trailing: AnimatedRotation(
              duration: Duration(
                milliseconds: 200,
              ),
              turns: isClicked ? 1.0 / 2.0 : 0.0,
              child: Icon(
                Icons.expand_more,
                color: isClicked ? Colors.blue : null,
              ),
            ),
          ),
          ClipRect(
            child: AnimatedAlign(
              heightFactor: isClicked ? 1 : 0,
              alignment: isClicked ? Alignment.center : Alignment.center,
              duration: Duration(
                milliseconds: 200,
              ),
              child: Column(
                children: widget.children,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
