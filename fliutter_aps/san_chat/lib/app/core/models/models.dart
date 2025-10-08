enum Status { initial, loading, success, error }

enum ToastType { info, warning, succes, error }

class ToastInterface {
  final bool showToast;
  final String title;
  final String description;

  const ToastInterface({
    this.showToast = false,
    required this.title,
    required this.description,
  });
}
