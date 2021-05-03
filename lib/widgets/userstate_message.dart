import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/images.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class UserStateMessage extends StatelessWidget {
  UserStateMessage(this.url, this.nombre);

  final String url;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12,
                  border: Border(),
                ),
                child: IconButton(
                  iconSize: 10,
                  icon: ImageFactory.svg(url),
                  splashRadius: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(nombre)
        ],
      ),
    );
  }
}
