import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_app/controllers/youtube_details_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailsScreen extends GetView<YoutubeDetailsController> {
  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              controller.video.value.snippet!.title,
              style: TextStyle(fontSize: 15,color: Colors.white),
            ),
            Row(
              children: [
                Text(
                  "Views ${controller.statistics.value.viewCount ?? '_'}",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Text(" · "),
                Text(
                  DateFormat("yyyy-MM-dd").format(DateTime.parse(
                      controller.video.value.snippet!.publishTime!)),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Obx(
        () => Text(
          controller.video.value.snippet!.description == ""
              ? "No Description"
              : controller.video.value.snippet!.description,
          style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Widget _buttonOne(String iconPath, String text) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/svg/icons/$iconPath.svg",
              color: Colors.white,
            ),
            Text(text,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white
            ),)
          ],
        ),
      ),
    );
  }

  Widget _buttonZone() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buttonOne("like", controller.statistics.value.likeCount.toString()),
          _buttonOne(
              "dislike", controller.statistics.value.favoriteCount.toString()),
          _buttonOne("share", "share"),
          _buttonOne("save", "save"),
        ],
      ),
    );
  }

  Widget get line => Container(
        height: 1,
        color: Colors.white.withOpacity(0.4),
      );

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Obx(
        () => Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network(
                      controller.youtuber.value.snippet != null
                          ? controller
                              .youtuber.value.snippet!.thumbnails!.medium!.url
                          : "image")
                  .image,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    controller.youtuber.value.snippet != null
                        ? controller.youtuber.value.snippet!.title
                        : "title",
                    style: TextStyle(fontSize: 18,color: Colors.white),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    controller.youtuber.value.statistics != null
                        ? "Subscribe ${controller.youtuber.value.statistics!.subscriberCount}"
                        : "subscribe",
                    style: TextStyle(
                        fontSize: 14, color: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Text(
                "Comments ${controller.statistics.value.commentCount}",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          line,
          _descriptionZone(),
          _buttonZone(),
          SizedBox(height: 20),
          line,
          _ownerZone()
        ],
      ),
    );
  }

  //صفحة تشغيل الفيديو
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              controller: controller.playController!,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: [
                const SizedBox(width: 8.0),
                Text(
                  controller.playController!.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onPressed: () {},
                ),
              ],
              onReady: () {},
              onEnded: (data) {},
            ),
            const SizedBox(
              height: 15,
            ),
            _description(),
            // Expanded(
            //   child: _description(),
            // )
          ],
        ),
      ),
    );
  }
}
