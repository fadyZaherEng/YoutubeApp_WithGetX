import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Video Options",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }

  Widget _itemButton({
    required String icon,
    required double iconSize,
    required String label,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: Container(
                width: iconSize,
                height: iconSize,
                child: SvgPicture.asset("assets/svg/icons/$icon.svg"),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _header(),
          SizedBox(height: 10),
          _itemButton(
            icon: "upload",
            iconSize: 17,
            label: "upload",
            onTap: () {},
          ),
          SizedBox(height: 10),
          _itemButton(
            icon: "broadcast",
            iconSize: 25,
            label: "broadcast",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
