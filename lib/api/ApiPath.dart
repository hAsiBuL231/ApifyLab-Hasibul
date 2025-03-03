abstract class ApiPath {
  static const baseUrl = "https://ezyappteam.ezycourse.com/api/app";
  static const login = "student/auth/login";

  static const getPost = "teacher/community/getFeed?status=feed&";
  static const createPost = "teacher/community/createFeedWithUpload?";
  static const createOrUpdateReaction = "teacher/community/createLike?=&=&=&=";
  static const reactionList = "teacher/community/getAllReactionType?feed_id=180370";
  static const fetchComments = "student/comment/getComment/:feedI_id?more=null";
  static const createComments = "student/comment/createComment";
  static const addReply = "student/comment/createComment";
  static const fetchReply = "student/comment/getReply/61231?more=null";
  static const logout = "student/auth/logout";
}
