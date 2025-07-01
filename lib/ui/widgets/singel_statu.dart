import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SingelStatu extends StatelessWidget {
  final String iconPath;
  final String name;
  final Widget content;
  const SingelStatu(
      {super.key,
      required this.iconPath,
      required this.name,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 164,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 4,
            children: [
              SvgPicture.asset(
                iconPath,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  color: Colors.black.withOpacity(0.3),
                ),
              )
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Expanded(child: content)
        ],
      ),
    );
  }
}
