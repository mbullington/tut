library dartkit.async;

import "dart:async";

typedef void _VoidCallback();

abstract class Debounce implements Function {
  _VoidCallback get callback;

  void call();

  factory Debounce.interval(_VoidCallback callback, int milliseconds) {
    return _DurationDebounce(callback, Duration(milliseconds: milliseconds));
  }

  factory Debounce.duration(_VoidCallback callback, Duration duration) = _DurationDebounce;

  factory Debounce.microtask(_VoidCallback callback) = _MicrotaskDebounce;
}

class _DurationDebounce implements Debounce {
  Future _queued;

  final _VoidCallback callback;
  final Duration duration;

  _DurationDebounce(this.callback, this.duration);

  @override
  void call() {
    if (_queued != null) {
      return;
    }

    _queued = Future.delayed(duration, () {
      _queued = null;
      return callback();
    });
  }
}

class _MicrotaskDebounce implements Debounce {
  Future _queued;

  final _VoidCallback callback;

  _MicrotaskDebounce(this.callback);

  @override
  void call() {
    if (_queued != null) {
      return;
    }

    _queued = Future.microtask(() {
      _queued = null;
      return callback();
    });
  }
}