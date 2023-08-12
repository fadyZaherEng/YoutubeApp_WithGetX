import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_app/controllers/all_video_controller.dart';
import 'package:youtube_app/controllers/video_controller.dart';
import 'package:youtube_app/shared/components/custom_appbar.dart';
import 'package:youtube_app/shared/components/video_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeVideosScreen extends StatefulWidget {
  @override
  State<HomeVideosScreen> createState() => _HomeVideosScreenState();
}

class _HomeVideosScreenState extends State<HomeVideosScreen> {
  AllVideosController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(AllVideosController());
  }
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ConditionalBuilder(
        condition: controller!.youtubeResponseBasedQ.value.items != null &&
            controller!.youtubeResponseBasedQ.value.items!.isNotEmpty,
        builder: (context) => CustomScrollView(
          controller: controller!.scrollController,
          slivers: [
            // SliverAppBar(
            //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            //   title: CustomAppBar(),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Get.put(
                      VideoController(
                          video: controller!
                              .youtubeResponseBasedQ.value.items![index]),
                      tag: controller!.youtubeResponseBasedQ.value.items![index]
                          .id!.videoId);
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
    );
  }
}
