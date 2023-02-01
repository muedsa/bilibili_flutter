class VideoMediaInfo {
  final String title;
  final String subtitle;
  final String mediaUrl;
  final Map<String, String> mediaHttpHeaders;

  const VideoMediaInfo(
      {required this.title,
      required this.subtitle,
      required this.mediaUrl,
      required this.mediaHttpHeaders});
}
