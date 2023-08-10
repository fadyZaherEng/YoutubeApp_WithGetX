import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_app/controllers/all_video_controller.dart';
import 'package:youtube_app/shared/components/custom_appbar.dart';
import 'package:youtube_app/shared/components/video_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeVideosScreen extends StatelessWidget {
  final controller = Get.put(AllVideosController());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => ConditionalBuilder(
              condition:controller.youtubeResponseBasedQ.value.items!.isNotEmpty,
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
                          child: VideoWidget(
                            video: controller.youtubeResponseBasedQ.value
                                .items![index],
                          ),
                        );
                      },
                      childCount: controller.youtubeResponseBasedQ.value.items!
                          .length,
                    ),
                  ),
                ],
              ),
              fallback: (context) => CircularProgressIndicator(),
          ),
    );
  }
}
