class LessonsTopicModel {
  String? code;
  String? message;
  List<Data>? data;

  LessonsTopicModel({this.code, this.message, this.data});

  LessonsTopicModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? iD;
  String? postTitle;
  String? postContent;
  String? postName;
  int? topicId;
  List<String>? attachments;
  bool? thumbnail;
  List<Video>? video;

  Data(
      {this.iD,
        this.postTitle,
        this.postContent,
        this.postName,
        this.topicId,
        this.attachments,
        this.thumbnail,
        this.video});

  Data.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    postTitle = json['post_title'];
    postContent = json['post_content'];
    postName = json['post_name'];
    topicId = json['topic_id'];
    attachments = json['attachments'].cast<String>();
    thumbnail = json['thumbnail'];
    if (json['video'] != null) {
      video = <Video>[];
      json['video'].forEach((v) {
        video!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['post_title'] = postTitle;
    data['post_content'] = postContent;
    data['post_name'] = postName;
    data['topic_id'] = topicId;
    data['attachments'] = attachments;
    data['thumbnail'] = thumbnail;
    if (video != null) {
      data['video'] = video!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Video {
  String? source;
  String? sourceVideoId;
  String? poster;
  String? posterUrl;
  String? sourceHtml5;
  String? sourceExternalUrl;
  String? sourceShortcode;
  String? sourceYoutube;
  String? sourceVimeo;
  String? sourceEmbedded;
  Runtime? runtime;

  Video(
      {this.source,
        this.sourceVideoId,
        this.poster,
        this.posterUrl,
        this.sourceHtml5,
        this.sourceExternalUrl,
        this.sourceShortcode,
        this.sourceYoutube,
        this.sourceVimeo,
        this.sourceEmbedded,
        this.runtime});

  Video.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    sourceVideoId = json['source_video_id'];
    poster = json['poster'];
    posterUrl = json['poster_url'];
    sourceHtml5 = json['source_html5'];
    sourceExternalUrl = json['source_external_url'];
    sourceShortcode = json['source_shortcode'];
    sourceYoutube = json['source_youtube'];
    sourceVimeo = json['source_vimeo'];
    sourceEmbedded = json['source_embedded'];
    runtime =
    json['runtime'] != null ? Runtime.fromJson(json['runtime']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['source_video_id'] = sourceVideoId;
    data['poster'] = poster;
    data['poster_url'] = posterUrl;
    data['source_html5'] = sourceHtml5;
    data['source_external_url'] = sourceExternalUrl;
    data['source_shortcode'] = sourceShortcode;
    data['source_youtube'] = sourceYoutube;
    data['source_vimeo'] = sourceVimeo;
    data['source_embedded'] = sourceEmbedded;
    if (runtime != null) {
      data['runtime'] = runtime!.toJson();
    }
    return data;
  }
}

class Runtime {
  String? hours;
  String? minutes;
  String? seconds;

  Runtime({this.hours, this.minutes, this.seconds});

  Runtime.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hours'] = hours;
    data['minutes'] = minutes;
    data['seconds'] = seconds;
    return data;
  }
}