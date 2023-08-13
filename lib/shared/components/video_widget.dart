import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_app/controllers/video_controller.dart';
import 'package:youtube_app/models/youtube_model_based_q/Item.dart';

class VideoWidget extends StatefulWidget {
  final Video video;

  VideoWidget({required this.video});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController? videoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController=Get.put(VideoController(video: widget.video),tag: widget.video.id!.videoId);
  }
  Widget _thumbnail() {
    return Container(
      height: 230,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        widget.video.snippet!.thumbnails!.medium!.url,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage:
                  Image.network(videoController!.youtuberThumbnailsUrl).image),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(widget.video.snippet!.title, maxLines: 2)),
                    IconButton(
                      alignment: Alignment.topCenter,
                      icon: Icon(Icons.more_vert, size: 18),
                      onPressed: () {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.video.snippet!.channelTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                   // Text(" · "),
                    SizedBox(width: 5,),
                    Text(
                      "views ${videoController!.statistics.value.viewCount ?? '-'}",
                    ),
                    Text(" · "),
                    Text(
                      DateFormat("yyyy-MM-dd").format(DateTime.parse(
                          widget.video.snippet!.publishTime.toString())),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

//عرض الفيديو في ال هوم سكرين بره
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            _thumbnail(),
            _simpleDetailinfo(),
          ],
        ));
  }
}
