// ignore_for_file: invalid_use_of_protected_member, deprecated_member_use, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_app/controllers/search_controller.dart';
import 'package:youtube_app/controllers/video_controller.dart';
import 'package:youtube_app/shared/components/video_widget.dart';

class SearchVideosScreen extends GetView<SearchYoutubeController> {
  var Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg/icons/back.svg"),
          onPressed: () {
            controller.youtubeResponseBasedQ.value.items=[];
            Get.back();
          },
        ),
        title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextFormField(
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              controller: Controller,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: Text(
                  "Search",
                  style: TextStyle(color: Colors.black),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
              onFieldSubmitted: (key) {
                controller.submitSearch(key);
              },
              // onChanged: (key) {
              //   controller.submitSearch(key);
              // },
            )),
      ),
      body: Obx(
        () => controller.youtubeResponseBasedQ.value.items != null &&
                controller.youtubeResponseBasedQ.value.items!.length > 0
            ? _searchResultView(context)
            : (controller.history.value.length > 0)
                ? _searchHistory(context)
                : Center(
                    child: Text(
                      "Not History",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
      ),
    );
  }

  _searchHistory(BuildContext context) {
    return ListView(
      children: controller.history.value
          .map(
            (element) => ListTile(
              onTap: () {
                controller.submitSearch(element);
              },
              leading: SvgPicture.asset(
                "assets/svg/icons/wall-clock.svg",
                width: 20,
                color: Colors.white,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(element),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          )
          .toList(),
    );
  }

  _searchResultView(BuildContext context) {
    return ConditionalBuilder(
      condition: controller.youtubeResponseBasedQ.value.items != null &&
          controller.youtubeResponseBasedQ.value.items!.isNotEmpty,
      builder: (context) => CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Get.put(
                    VideoController(
                        video: controller
                            .youtubeResponseBasedQ.value.items![index]),
                    tag: controller
                        .youtubeResponseBasedQ.value.items![index].id!.videoId);
                return InkWell(
                  onTap: () async {
                    Get.toNamed(
                        "/detail/${controller.youtubeResponseBasedQ.value.items![index].id!.videoId}");
                  },
                  child: Column(
                    children: [
                      VideoWidget(
                        video: controller
                            .youtubeResponseBasedQ.value.items![index],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              },
              childCount: controller.youtubeResponseBasedQ.value.items!.length,
            ),
          ),
        ],
      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );
  }
}
