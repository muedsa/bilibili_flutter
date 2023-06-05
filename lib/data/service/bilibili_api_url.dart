class BilibiliURL {
  static const String recommendedVideos =
      'https://api.bilibili.com/x/web-interface/popular?pn=%d&ps=%d';

  static const String liveRoomPlayUrl =
      'https://api.live.bilibili.com/room/v1/Room/playUrl?cid=%d&qn=%d&platform=android';

  static const String liveRoomList =
      'https://api.live.bilibili.com/room/v3/area/getRoomList?page=%d&page_size=%d&parent_area_id=%d&sort_type=%s';

  //static const String getRoomInfo = 'https://api.live.bilibili.com/room/v1/Room/get_info';
  static const String liveRoomInfo =
      'https://api.live.bilibili.com/xlive/web-room/v1/index/getInfoByRoom?room_id=%d';

  static const String liveRoomDanmakuInfo =
      'https://api.live.bilibili.com/xlive/web-room/v1/index/getDanmuInfo?id=%d&type=0';

  // websocket
  static const String liveRoomWsChat =
      'wss://broadcastlv.chat.bilibili.com:443/sub';

  static const String searchLIVE =
      'https://api.bilibili.com/x/web-interface/search/type?page=%d&page_size=%d&order=online&platform=android&keyword=%s&search_type=live';

  static const String searchVideo =
      'https://api.bilibili.com/x/web-interface/search/type?page=%d&page_size=%d&order=online&platform=android&keyword=%s&search_type=video';

  static const String searchByType =
      'https://api.bilibili.com/x/web-interface/search/type?page=%d&page_size=%d&order=online&platform=android&keyword=%s&search_type=%s';

  static const String searchAll =
      'https://api.bilibili.com/x/web-interface/search/all?page=%d&page_size=%d&order=online&platform=android&keyword=%s';

  static const String userNav = 'https://api.bilibili.com/x/web-interface/nav';

  static const String passportLoginUrl =
      'http://passport.bilibili.com/qrcode/getLoginUrl';

  static const String passportLoginInfo =
      'http://passport.bilibili.com/qrcode/getLoginInfo';

  // html response
  static const String videoPageUrl = 'https://www.bilibili.com/video/%s?p=%d';

  static const String historyList =
      'https://api.bilibili.com/x/web-interface/history/cursor?max=0&view_at=0&business=';

  // protobuf response
  static const String videoDanmakuView =
      'https://api.bilibili.com/x/v2/dm/web/view?type=1&oid=%d';

  // protobuf response
  static const String videoDanmakuSegment =
      'https://api.bilibili.com/x/v2/dm/web/seg.so?type=1&oid=%d&segment_index=%d';

  static const String videoPlayUrl =
      'https://api.bilibili.com/x/player/playurl?bvid=%s&cid=%d&fourk=1&qn=140&platform=android&fnval=80';
}
