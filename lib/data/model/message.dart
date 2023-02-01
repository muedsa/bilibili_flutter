class ActionMessage<T> {
  bool success;
  String? message;
  T? data;

  ActionMessage({required this.success, this.message, this.data});

  static ActionMessage<T> s<T>(data) {
    return ActionMessage<T>(success: true, data: data);
  }

  static ActionMessage<T> f<T>(message) {
    return ActionMessage<T>(success: false, message: message);
  }
}
