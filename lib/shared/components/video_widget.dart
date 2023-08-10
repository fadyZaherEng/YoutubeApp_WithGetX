import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_app/controllers/video_controller.dart';
import 'package:youtube_app/models/youtube_model_based_q/Item.dart';

class VideoWidget extends StatefulWidget {
  final Video video;

  const VideoWidget({required this.video});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController? _videoController;

  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video));
    super.initState();
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
                  Image.network(_videoController!.youtuberThumbnailsUrl).image),
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
                    Text(
                      widget.video.snippet!.channelTitle,
                    ),
                    Text(" · "),
                    Text(
                      "views ${_videoController!.statistics.value.viewCount ?? '-'}",
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
