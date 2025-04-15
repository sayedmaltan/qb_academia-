class LessonsModel {
  String? code;
  String? message;
  List<Data>? data;

  LessonsModel({this.code, this.message, this.data});

  LessonsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? summary;
  List<Contents>? contents;

  Data({this.id, this.title, this.summary, this.contents});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    if (json['contents'] != null) {
      contents = <Contents>[];
      json['contents'].forEach((v) {
        contents!.add(new Contents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['summary'] = this.summary;
    if (this.contents != null) {
      data['contents'] = this.contents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contents {
  int? iD;
  String? postAuthor;
  String? postDate;
  String? postDateGmt;
  String? postContent;
  String? postTitle;
  String? postExcerpt;
  String? postStatus;
  String? commentStatus;
  String? pingStatus;
  String? postPassword;
  String? postName;
  String? toPing;
  String? pinged;
  String? postModified;
  String? postModifiedGmt;
  String? postContentFiltered;
  int? postParent;
  String? guid;
  int? menuOrder;
  String? postType;
  String? postMimeType;
  String? commentCount;
  String? filter;

  Contents(
      {this.iD,
        this.postAuthor,
        this.postDate,
        this.postDateGmt,
        this.postContent,
        this.postTitle,
        this.postExcerpt,
        this.postStatus,
        this.commentStatus,
        this.pingStatus,
        this.postPassword,
        this.postName,
        this.toPing,
        this.pinged,
        this.postModified,
        this.postModifiedGmt,
        this.postContentFiltered,
        this.postParent,
        this.guid,
        this.menuOrder,
        this.postType,
        this.postMimeType,
        this.commentCount,
        this.filter});

  Contents.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    postAuthor = json['post_author'];
    postDate = json['post_date'];
    postDateGmt = json['post_date_gmt'];
    postContent = json['post_content'];
    postTitle = json['post_title'];
    postExcerpt = json['post_excerpt'];
    postStatus = json['post_status'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    postPassword = json['post_password'];
    postName = json['post_name'];
    toPing = json['to_ping'];
    pinged = json['pinged'];
    postModified = json['post_modified'];
    postModifiedGmt = json['post_modified_gmt'];
    postContentFiltered = json['post_content_filtered'];
    postParent = json['post_parent'];
    guid = json['guid'];
    menuOrder = json['menu_order'];
    postType = json['post_type'];
    postMimeType = json['post_mime_type'];
    commentCount = json['comment_count'];
    filter = json['filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['post_author'] = this.postAuthor;
    data['post_date'] = this.postDate;
    data['post_date_gmt'] = this.postDateGmt;
    data['post_content'] = this.postContent;
    data['post_title'] = this.postTitle;
    data['post_excerpt'] = this.postExcerpt;
    data['post_status'] = this.postStatus;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['post_password'] = this.postPassword;
    data['post_name'] = this.postName;
    data['to_ping'] = this.toPing;
    data['pinged'] = this.pinged;
    data['post_modified'] = this.postModified;
    data['post_modified_gmt'] = this.postModifiedGmt;
    data['post_content_filtered'] = this.postContentFiltered;
    data['post_parent'] = this.postParent;
    data['guid'] = this.guid;
    data['menu_order'] = this.menuOrder;
    data['post_type'] = this.postType;
    data['post_mime_type'] = this.postMimeType;
    data['comment_count'] = this.commentCount;
    data['filter'] = this.filter;
    return data;
  }
}