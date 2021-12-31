library click;

import 'package:flutter/material.dart';

class Click extends StatefulWidget {
  const Click({Key? key}) : super(key: key);

  @override
  _ClickState createState() => _ClickState();
}

class _ClickState extends State<Click> {
  int? i;

  void changeIndex(int l) {
    if (i != l) {
      i = l;
    } else {
      i = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: List.generate(
          13,
          (index) => Stack(
            children: [
              AnimatedContainer(
                margin: const EdgeInsets.all(5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                      color: i != null && i == index
                          ? Colors.pinkAccent
                          : Colors.greenAccent),
                ),
                duration: const Duration(milliseconds: 300),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          changeIndex(index);
                        },
                        child: Center(child: Text("${index + 1}")))),
              ),
              Positioned(
                  bottom: 4,
                  right: 2,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: i == index
                        ? const Icon(
                            Icons.check_circle,
                            size: 15,
                            color: Colors.pinkAccent,
                          )
                        : const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
