import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_app/controllers/design_patterns_controller.dart';
import 'package:youtube_app/shared/components/custom_appbar.dart';
import 'package:youtube_app/shared/components/video_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class DesignPatternsVideosScreen extends StatefulWidget {
  @override
  State<DesignPatternsVideosScreen> createState() => _DesignPatternsVideosScreenState();
}

class _DesignPatternsVideosScreenState extends State<DesignPatternsVideosScreen> {
  dynamic controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(DesignsPatternsController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => ConditionalBuilder(
        condition:controller.youtubeResponseBasedQ.value.items!=null&&controller.youtubeResponseBasedQ.value.items!.isNotEmpty,
        builder: (context) => CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed("/details");
                    },
                    child: Column(
                      children: [
                        VideoWidget(
                          video: controller.youtubeResponseBasedQ.value
                              .items![index],
                        ),
                        Container(height: 1,color: Colors.grey,)
                      ],
                    ),
                  );
                },
                childCount: controller.youtubeResponseBasedQ.value.items!
                    .length,
              ),
            ),
          ],
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

