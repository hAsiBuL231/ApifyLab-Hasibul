import 'dart:convert';

class Post {
  final int? id;
  final int? schoolId;
  final int? userId;
  final dynamic courseId;
  final int? communityId;
  final dynamic groupId;
  final String? feedTxt;
  final String? status;
  final String? slug;
  final String? title;
  final String? activityType;
  final int? isPinned;
  final String? fileType;
  final List<dynamic>? files;
  final int? likeCount;
  final int? commentCount;
  final int? shareCount;
  final int? shareId;
  final MetaDataClass? metaData;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? feedPrivacy;
  final int? isBackground;
  final String? bgColor;
  final dynamic pollId;
  final dynamic lessonId;
  final int? spaceId;
  final dynamic videoId;
  final dynamic streamId;
  final dynamic blogId;
  final dynamic scheduleDate;
  final dynamic timezone;
  final dynamic isAnonymous;
  final dynamic meetingId;
  final dynamic sellerId;
  final DateTime? publishDate;
  final bool? isFeedEdit;
  final String? name;
  final String? pic;
  final int? uid;
  final int? isPrivateChat;
  final User? user;
  final dynamic follow;
  final dynamic group;
  final dynamic poll;
  final List<LikeType>? likeType;
  final Like? like;
  final dynamic savedPosts;
  final List<dynamic>? comments;
  final PurpleMeta? meta;

  Post({
    this.id,
    this.schoolId,
    this.userId,
    this.courseId,
    this.communityId,
    this.groupId,
    this.feedTxt,
    this.status,
    this.slug,
    this.title,
    this.activityType,
    this.isPinned,
    this.fileType,
    this.files,
    this.likeCount,
    this.commentCount,
    this.shareCount,
    this.shareId,
    this.metaData,
    this.createdAt,
    this.updatedAt,
    this.feedPrivacy,
    this.isBackground,
    this.bgColor,
    this.pollId,
    this.lessonId,
    this.spaceId,
    this.videoId,
    this.streamId,
    this.blogId,
    this.scheduleDate,
    this.timezone,
    this.isAnonymous,
    this.meetingId,
    this.sellerId,
    this.publishDate,
    this.isFeedEdit,
    this.name,
    this.pic,
    this.uid,
    this.isPrivateChat,
    this.user,
    this.follow,
    this.group,
    this.poll,
    this.likeType,
    this.like,
    this.savedPosts,
    this.comments,
    this.meta,
  });

  Post copyWith({
    int? id,
    int? schoolId,
    int? userId,
    dynamic courseId,
    int? communityId,
    dynamic groupId,
    String? feedTxt,
    String? status,
    String? slug,
    String? title,
    String? activityType,
    int? isPinned,
    String? fileType,
    List<dynamic>? files,
    int? likeCount,
    int? commentCount,
    int? shareCount,
    int? shareId,
    MetaDataClass? metaData,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? feedPrivacy,
    int? isBackground,
    String? bgColor,
    dynamic pollId,
    dynamic lessonId,
    int? spaceId,
    dynamic videoId,
    dynamic streamId,
    dynamic blogId,
    dynamic scheduleDate,
    dynamic timezone,
    dynamic isAnonymous,
    dynamic meetingId,
    dynamic sellerId,
    DateTime? publishDate,
    bool? isFeedEdit,
    String? name,
    String? pic,
    int? uid,
    int? isPrivateChat,
    User? user,
    dynamic follow,
    dynamic group,
    dynamic poll,
    List<LikeType>? likeType,
    Like? like,
    dynamic savedPosts,
    List<dynamic>? comments,
    PurpleMeta? meta,
  }) =>
      Post(
        id: id ?? this.id,
        schoolId: schoolId ?? this.schoolId,
        userId: userId ?? this.userId,
        courseId: courseId ?? this.courseId,
        communityId: communityId ?? this.communityId,
        groupId: groupId ?? this.groupId,
        feedTxt: feedTxt ?? this.feedTxt,
        status: status ?? this.status,
        slug: slug ?? this.slug,
        title: title ?? this.title,
        activityType: activityType ?? this.activityType,
        isPinned: isPinned ?? this.isPinned,
        fileType: fileType ?? this.fileType,
        files: files ?? this.files,
        likeCount: likeCount ?? this.likeCount,
        commentCount: commentCount ?? this.commentCount,
        shareCount: shareCount ?? this.shareCount,
        shareId: shareId ?? this.shareId,
        metaData: metaData ?? this.metaData,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        feedPrivacy: feedPrivacy ?? this.feedPrivacy,
        isBackground: isBackground ?? this.isBackground,
        bgColor: bgColor ?? this.bgColor,
        pollId: pollId ?? this.pollId,
        lessonId: lessonId ?? this.lessonId,
        spaceId: spaceId ?? this.spaceId,
        videoId: videoId ?? this.videoId,
        streamId: streamId ?? this.streamId,
        blogId: blogId ?? this.blogId,
        scheduleDate: scheduleDate ?? this.scheduleDate,
        timezone: timezone ?? this.timezone,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        meetingId: meetingId ?? this.meetingId,
        sellerId: sellerId ?? this.sellerId,
        publishDate: publishDate ?? this.publishDate,
        isFeedEdit: isFeedEdit ?? this.isFeedEdit,
        name: name ?? this.name,
        pic: pic ?? this.pic,
        uid: uid ?? this.uid,
        isPrivateChat: isPrivateChat ?? this.isPrivateChat,
        user: user ?? this.user,
        follow: follow ?? this.follow,
        group: group ?? this.group,
        poll: poll ?? this.poll,
        likeType: likeType ?? this.likeType,
        like: like ?? this.like,
        savedPosts: savedPosts ?? this.savedPosts,
        comments: comments ?? this.comments,
        meta: meta ?? this.meta,
      );

  //factory Post.fromJson(String str) => Post.fromMap(jsonDecode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        schoolId: json["school_id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        communityId: json["community_id"],
        groupId: json["group_id"],
        feedTxt: json["feed_txt"],
        status: json["status"],
        slug: json["slug"],
        title: json["title"],
        activityType: json["activity_type"],
        isPinned: json["is_pinned"],
        fileType: json["file_type"],
        files: json["files"] == null ? [] : List<dynamic>.from(json["files"]!.map((x) => x)),
        likeCount: json["like_count"],
        commentCount: json["comment_count"],
        shareCount: json["share_count"],
        shareId: json["share_id"],
        metaData: json["meta_data"] == null ? null : MetaDataClass.fromMap(json["meta_data"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        feedPrivacy: json["feed_privacy"],
        isBackground: json["is_background"],
        bgColor: json["bg_color"],
        pollId: json["poll_id"],
        lessonId: json["lesson_id"],
        spaceId: json["space_id"],
        videoId: json["video_id"],
        streamId: json["stream_id"],
        blogId: json["blog_id"],
        scheduleDate: json["schedule_date"],
        timezone: json["timezone"],
        isAnonymous: json["is_anonymous"],
        meetingId: json["meeting_id"],
        sellerId: json["seller_id"],
        publishDate: json["publish_date"] == null ? null : DateTime.parse(json["publish_date"]),
        isFeedEdit: json["is_feed_edit"],
        name: json["name"],
        pic: json["pic"],
        uid: json["uid"],
        isPrivateChat: json["is_private_chat"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        follow: json["follow"],
        group: json["group"],
        poll: json["poll"],
        likeType: json["likeType"] == null ? [] : List<LikeType>.from(json["likeType"]!.map((x) => LikeType.fromMap(x))),
        like: json["like"] == null ? null : Like.fromMap(json["like"]),
        savedPosts: json["savedPosts"],
        comments: json["comments"] == null ? [] : List<dynamic>.from(json["comments"]!.map((x) => x)),
        meta: json["meta"] == null ? null : PurpleMeta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "school_id": schoolId,
        "user_id": userId,
        "course_id": courseId,
        "community_id": communityId,
        "group_id": groupId,
        "feed_txt": feedTxt,
        "status": status,
        "slug": slug,
        "title": title,
        "activity_type": activityType,
        "is_pinned": isPinned,
        "file_type": fileType,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
        "like_count": likeCount,
        "comment_count": commentCount,
        "share_count": shareCount,
        "share_id": shareId,
        "meta_data": metaData?.toMap(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "feed_privacy": feedPrivacy,
        "is_background": isBackground,
        "bg_color": bgColor,
        "poll_id": pollId,
        "lesson_id": lessonId,
        "space_id": spaceId,
        "video_id": videoId,
        "stream_id": streamId,
        "blog_id": blogId,
        "schedule_date": scheduleDate,
        "timezone": timezone,
        "is_anonymous": isAnonymous,
        "meeting_id": meetingId,
        "seller_id": sellerId,
        "publish_date": publishDate?.toIso8601String(),
        "is_feed_edit": isFeedEdit,
        "name": name,
        "pic": pic,
        "uid": uid,
        "is_private_chat": isPrivateChat,
        "user": user?.toMap(),
        "follow": follow,
        "group": group,
        "poll": poll,
        "likeType": likeType == null ? [] : List<dynamic>.from(likeType!.map((x) => x.toMap())),
        "like": like?.toMap(),
        "savedPosts": savedPosts,
        "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
        "meta": meta?.toMap(),
      };
}

class Like {
  final int? id;
  final int? feedId;
  final int? userId;
  final String? reactionType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? isAnonymous;
  final MetaDataClass? meta;

  Like({
    this.id,
    this.feedId,
    this.userId,
    this.reactionType,
    this.createdAt,
    this.updatedAt,
    this.isAnonymous,
    this.meta,
  });

  Like copyWith({
    int? id,
    int? feedId,
    int? userId,
    String? reactionType,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? isAnonymous,
    MetaDataClass? meta,
  }) =>
      Like(
        id: id ?? this.id,
        feedId: feedId ?? this.feedId,
        userId: userId ?? this.userId,
        reactionType: reactionType ?? this.reactionType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isAnonymous: isAnonymous ?? this.isAnonymous,
        meta: meta ?? this.meta,
      );

  factory Like.fromJson(String str) => Like.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Like.fromMap(Map<String, dynamic> json) => Like(
        id: json["id"],
        feedId: json["feed_id"],
        userId: json["user_id"],
        reactionType: json["reaction_type"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        isAnonymous: json["is_anonymous"],
        meta: json["meta"] == null ? null : MetaDataClass.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "feed_id": feedId,
        "user_id": userId,
        "reaction_type": reactionType,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_anonymous": isAnonymous,
        "meta": meta?.toMap(),
      };
}

class MetaDataClass {
  MetaDataClass();

  MetaDataClass copyWith() => MetaDataClass();

  factory MetaDataClass.fromJson(String str) => MetaDataClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetaDataClass.fromMap(Map<String, dynamic> json) => MetaDataClass();

  Map<String, dynamic> toMap() => {};
}

class LikeType {
  final String? reactionType;
  final int? feedId;
  final MetaDataClass? meta;

  LikeType({
    this.reactionType,
    this.feedId,
    this.meta,
  });

  LikeType copyWith({
    String? reactionType,
    int? feedId,
    MetaDataClass? meta,
  }) =>
      LikeType(
        reactionType: reactionType ?? this.reactionType,
        feedId: feedId ?? this.feedId,
        meta: meta ?? this.meta,
      );

  factory LikeType.fromJson(String str) => LikeType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LikeType.fromMap(Map<String, dynamic> json) => LikeType(
        reactionType: json["reaction_type"],
        feedId: json["feed_id"],
        meta: json["meta"] == null ? null : MetaDataClass.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "reaction_type": reactionType,
        "feed_id": feedId,
        "meta": meta?.toMap(),
      };
}

class PurpleMeta {
  final int? views;

  PurpleMeta({
    this.views,
  });

  PurpleMeta copyWith({
    int? views,
  }) =>
      PurpleMeta(
        views: views ?? this.views,
      );

  factory PurpleMeta.fromJson(String str) => PurpleMeta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PurpleMeta.fromMap(Map<String, dynamic> json) => PurpleMeta(
        views: json["views"],
      );

  Map<String, dynamic> toMap() => {
        "views": views,
      };
}

class User {
  final int? id;
  final String? fullName;
  final String? profilePic;
  final int? isPrivateChat;
  final dynamic expireDate;
  final String? status;
  final dynamic pauseDate;
  final String? userType;
  final MetaDataClass? meta;

  User({
    this.id,
    this.fullName,
    this.profilePic,
    this.isPrivateChat,
    this.expireDate,
    this.status,
    this.pauseDate,
    this.userType,
    this.meta,
  });

  User copyWith({
    int? id,
    String? fullName,
    String? profilePic,
    int? isPrivateChat,
    dynamic expireDate,
    String? status,
    dynamic pauseDate,
    String? userType,
    MetaDataClass? meta,
  }) =>
      User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        profilePic: profilePic ?? this.profilePic,
        isPrivateChat: isPrivateChat ?? this.isPrivateChat,
        expireDate: expireDate ?? this.expireDate,
        status: status ?? this.status,
        pauseDate: pauseDate ?? this.pauseDate,
        userType: userType ?? this.userType,
        meta: meta ?? this.meta,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        profilePic: json["profile_pic"],
        isPrivateChat: json["is_private_chat"],
        expireDate: json["expire_date"],
        status: json["status"],
        pauseDate: json["pause_date"],
        userType: json["user_type"],
        meta: json["meta"] == null ? null : MetaDataClass.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "full_name": fullName,
        "profile_pic": profilePic,
        "is_private_chat": isPrivateChat,
        "expire_date": expireDate,
        "status": status,
        "pause_date": pauseDate,
        "user_type": userType,
        "meta": meta?.toMap(),
      };
}
