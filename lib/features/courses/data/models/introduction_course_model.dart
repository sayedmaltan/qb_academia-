class IntroductionCourseModel {
  final String code;
  final String message;
  final CourseData data;

  IntroductionCourseModel({required this.code, required this.message, required this.data});

  factory IntroductionCourseModel.fromJson(Map<String, dynamic> json) {
    return IntroductionCourseModel(
      code: json['code'],
      message: json['message'],
      data: CourseData.fromJson(json['data']),
    );
  }
}

class CourseData {
  final List<Course> posts;
  final int totalCourse;
  final int totalPage;

  CourseData({required this.posts, required this.totalCourse, required this.totalPage});

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      posts: List<Course>.from(json['posts'].map((x) => Course.fromJson(x))),
      totalCourse: json['total_course'],
      totalPage: json['total_page'],
    );
  }
}

class Course {
  final int id;
  final Author postAuthor;
  final String postDate;
  final String postDateGmt;
  final String postContent;
  final String postTitle;
  final String postExcerpt;
  final String postStatus;
  final String commentStatus;
  final String pingStatus;
  final String postPassword;
  final String postName;
  final String toPing;
  final String pinged;
  final String postModified;
  final String postModifiedGmt;
  final String postContentFiltered;
  final int postParent;
  final String guid;
  final int menuOrder;
  final String postType;
  final String postMimeType;
  final String commentCount;
  final String thumbnailUrl;
  final AdditionalInfo additionalInfo;
  final Ratings ratings;
  final List<dynamic> courseCategory;
  final List<dynamic> courseTag;
  final String price;

  Course({
    required this.id,
    required this.postAuthor,
    required this.postDate,
    required this.postDateGmt,
    required this.postContent,
    required this.postTitle,
    required this.postExcerpt,
    required this.postStatus,
    required this.commentStatus,
    required this.pingStatus,
    required this.postPassword,
    required this.postName,
    required this.toPing,
    required this.pinged,
    required this.postModified,
    required this.postModifiedGmt,
    required this.postContentFiltered,
    required this.postParent,
    required this.guid,
    required this.menuOrder,
    required this.postType,
    required this.postMimeType,
    required this.commentCount,
    required this.thumbnailUrl,
    required this.additionalInfo,
    required this.ratings,
    required this.courseCategory,
    required this.courseTag,
    required this.price,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['ID'],
      postAuthor: Author.fromJson(json['post_author']),
      postDate: json['post_date'],
      postDateGmt: json['post_date_gmt'],
      postContent: json['post_content'],
      postTitle: json['post_title'],
      postExcerpt: json['post_excerpt'],
      postStatus: json['post_status'],
      commentStatus: json['comment_status'],
      pingStatus: json['ping_status'],
      postPassword: json['post_password'],
      postName: json['post_name'],
      toPing: json['to_ping'],
      pinged: json['pinged'],
      postModified: json['post_modified'],
      postModifiedGmt: json['post_modified_gmt'],
      postContentFiltered: json['post_content_filtered'],
      postParent: json['post_parent'],
      guid: json['guid'],
      menuOrder: json['menu_order'],
      postType: json['post_type'],
      postMimeType: json['post_mime_type'],
      commentCount: json['comment_count'],
      thumbnailUrl: json['thumbnail_url'],
      additionalInfo: AdditionalInfo.fromJson(json['additional_info']),
      ratings: Ratings.fromJson(json['ratings']),
      courseCategory: json['course_category'],
      courseTag: json['course_tag'],
      price: json['price'],
    );
  }
}

class Author {
  final String id;
  final String userLogin;
  final String userNicename;
  final String userEmail;
  final String userUrl;
  final String userRegistered;
  final String userStatus;
  final String displayName;

  Author({
    required this.id,
    required this.userLogin,
    required this.userNicename,
    required this.userEmail,
    required this.userUrl,
    required this.userRegistered,
    required this.userStatus,
    required this.displayName,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['ID'],
      userLogin: json['user_login'],
      userNicename: json['user_nicename'],
      userEmail: json['user_email'],
      userUrl: json['user_url'],
      userRegistered: json['user_registered'],
      userStatus: json['user_status'],
      displayName: json['display_name'],
    );
  }
}

class AdditionalInfo {
  final List<CourseSetting> courseSettings;
  final List<String> coursePriceType;
  final List<CourseDuration> courseDuration;
  final List<String> courseLevel;
  final List<String> courseBenefits;
  final List<String> courseRequirements;
  final List<dynamic> courseTargetAudience;
  final List<String> courseMaterialIncludes;
  final List<Video> video;
  final bool disableQa;

  AdditionalInfo({
    required this.courseSettings,
    required this.coursePriceType,
    required this.courseDuration,
    required this.courseLevel,
    required this.courseBenefits,
    required this.courseRequirements,
    required this.courseTargetAudience,
    required this.courseMaterialIncludes,
    required this.video,
    required this.disableQa,
  });

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
      courseSettings: List<CourseSetting>.from(json['course_settings'].map((x) => CourseSetting.fromJson(x))),
      coursePriceType: List<String>.from(json['course_price_type']),
      courseDuration: List<CourseDuration>.from(json['course_duration'].map((x) => CourseDuration.fromJson(x))),
      courseLevel: List<String>.from(json['course_level']),
      courseBenefits: List<String>.from(json['course_benefits']),
      courseRequirements: List<String>.from(json['course_requirements']),
      courseTargetAudience: List<dynamic>.from(json['course_target_audience']),
      courseMaterialIncludes: List<String>.from(json['course_material_includes']),
      video: List<Video>.from(json['video'].map((x) => Video.fromJson(x))),
      disableQa: json['disable_qa'],
    );
  }
}

class CourseSetting {
  final int maximumStudents;
  final String enrollmentExpiry;
  final int enableContentDrip;
  final String contentDripType;
  final int enableTutorBp;
  final String courseEnrollmentPeriod;
  final String enrollmentStartsAt;
  final String enrollmentEndsAt;
  final String pauseEnrollment;

  CourseSetting({
    required this.maximumStudents,
    required this.enrollmentExpiry,
    required this.enableContentDrip,
    required this.contentDripType,
    required this.enableTutorBp,
    required this.courseEnrollmentPeriod,
    required this.enrollmentStartsAt,
    required this.enrollmentEndsAt,
    required this.pauseEnrollment,
  });

  factory CourseSetting.fromJson(Map<String, dynamic> json) {
    return CourseSetting(
      maximumStudents: json['maximum_students'],
      enrollmentExpiry: json['enrollment_expiry'],
      enableContentDrip: json['enable_content_drip'],
      contentDripType: json['content_drip_type'],
      enableTutorBp: json['enable_tutor_bp'],
      courseEnrollmentPeriod: json['course_enrollment_period'],
      enrollmentStartsAt: json['enrollment_starts_at'],
      enrollmentEndsAt: json['enrollment_ends_at'],
      pauseEnrollment: json['pause_enrollment'],
    );
  }
}

class CourseDuration {
  final String hours;
  final String minutes;

  CourseDuration({required this.hours, required this.minutes});

  factory CourseDuration.fromJson(Map<String, dynamic> json) {
    return CourseDuration(
      hours: json['hours'],
      minutes: json['minutes'],
    );
  }
}

class Video {
  final String source;
  final String sourceYoutube;

  Video({required this.source, required this.sourceYoutube});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      source: json['source'],
      sourceYoutube: json['source_youtube'],
    );
  }
}

class Ratings {
  final int ratingCount;
  final int ratingSum;
  final int ratingAvg;
  final Map<String, int> countByValue;

  Ratings({
    required this.ratingCount,
    required this.ratingSum,
    required this.ratingAvg,
    required this.countByValue,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) {
    return Ratings(
      ratingCount: json['rating_count'],
      ratingSum: json['rating_sum'],
      ratingAvg: json['rating_avg'],
      countByValue: Map<String, int>.from(json['count_by_value']),
    );
  }
}