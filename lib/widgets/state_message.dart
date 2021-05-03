import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/images.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class MessageUser extends StatelessWidget {
  MessageUser(this.svg, this.nombre, this.fecha);

  final String svg;
  final String nombre;
  final String fecha;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: SizedBox(
                height: 100,
                width: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                    border: Border(),
                  ),
                  child: IconButton(
                    iconSize: 10,
                    icon: ImageFactory.svg(svg),
                    splashRadius: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, bottom: 5, right: 0),
                  child: Text(
                    nombre,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
                  child: Row(
                    children: [
                      Text(
                        "Thats hilarious",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black26,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        " Really ",
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.black26,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        fecha,
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.black26,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
