import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/constants.dart';

class Button extends StatelessWidget {
  Button(
      {@required this.text,
      @required this.onPress,
      this.disable = false,
      Key key})
      : super(key: key);

  final String text;
  final void Function() onPress;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
        height: 60,
        width: constraints.maxWidth,
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              backgroundColor: !disable ? primaryColor : Color(0xFFFFAF91)),
          onPressed: !disable ? onPress : null,
        ),
      ),
    );
  }
}
