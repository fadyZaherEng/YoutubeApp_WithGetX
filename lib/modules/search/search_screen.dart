import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_app/controllers/search_controller.dart';
import 'package:youtube_app/controllers/video_controller.dart';
import 'package:youtube_app/shared/components/video_widget.dart';

class SearchVideosScreen extends GetView<SearchYoutubeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg/icons/back.svg"),
          onPressed: () {
            Get.back();
          },
        ),
        title: TextField(
          onSubmitted: (key) {
            controller.submitSearch(key);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      body: Obx(
        () => ConditionalBuilder(
          condition: controller!.youtubeResponseBasedQ.value.items != null &&
              controller!.youtubeResponseBasedQ.value.items!.isNotEmpty,
          builder: (context) => CustomScrollView(
            controller: controller!.scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Get.put(
                        VideoController(
                            video: controller!
                                .youtubeResponseBasedQ.value.items![index]),
                        tag: controller!.youtubeResponseBasedQ.value
                            .items![index].id!.videoId);
                    return InkWell(
                      onTap: () async {
                        Get.toNamed(
                            "/detail/${controller!.youtubeResponseBasedQ.value.items![index].id!.videoId}");
                      },
                      child: Column(
                        children: [
                          VideoWidget(
                            video: controller!
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
                  childCount:
                      controller!.youtubeResponseBasedQ.value.items!.length,
                ),
              ),
            ],
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
