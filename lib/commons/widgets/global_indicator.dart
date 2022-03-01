import 'package:flutter/material.dart';

OverlayEntry? _globalOverlayEntry;

/// 显示进度条
T showGlobalIndicator<T extends GlobalIndicator>({
  required BuildContext context,
  T? indicator,
}) {
  indicator ??= _GlobalIndicator() as T;

  if (_globalOverlayEntry?.mounted ?? false) _globalOverlayEntry!.remove();

  Overlay.of(context)!.insert(indicator.overlayEntry);

  return indicator;
}

abstract class GlobalIndicator {
  OverlayEntry get overlayEntry;

  void dismiss();

  factory GlobalIndicator() {
    return _GlobalIndicator();
  }
}

class _GlobalIndicator implements GlobalIndicator {
  @override
  OverlayEntry get overlayEntry => _globalOverlayEntry!;

  _GlobalIndicator() {
    _globalOverlayEntry ??= OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black12,
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  void dismiss() {
    _globalOverlayEntry?.remove();
  }
}
