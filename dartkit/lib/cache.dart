// inspired by quiver.cache and Akavache
// essentially just quiver.cache with invalidateAll

import "dart:async";

import "package:quiver/collection.dart" show LruMap;

import "./dartkit.dart";

// implementations:
// - InMemoryCache (uses a Map)
// - TODO: SQLiteCache (uses SQFlite)
// - TODO: EncryptedSQLiteCache (uses SQFlite, but encrypted)

typedef FutureOr<V> OrFetch<K, V>(K key);

abstract class Cache<K, V> {
  Future<V> get(K key, [OrFetch orFetch]);

  Future<Tuple<K, V>> set(K key, V value);

  Future<Null> invalidate(K key);

  Future<Null> invalidateAll();
}

class InMemoryCache<K, V> implements Cache<K, V> {
  final Map<K, V> _map;

  Map<K, Future<V>> _pending = {};

  InMemoryCache(): _map = <K, V>{};

  InMemoryCache.lru(int maxSize): _map = LruMap<K, V>(maximumSize: maxSize);

  Future<V> get(K key, [OrFetch orFetch]) async {
    if (_pending.containsKey(key)) {
      return await _pending[key];
    }

    if (!_map.containsKey(key)) {
      if (orFetch == null) {
        return null;
      }

      final value = orFetch(key);

      if (value is Future) {
        final Completer<V> completer = Completer<V>();
        _pending[key] = completer.future;

        _map[key] = await value;

        _pending.remove(key);
        completer.complete(_map[key]);
      } else {
        _map[key] = value;
      }
    }

    return _map[key];
  }

  Future<Tuple<K, V>> set(K key, V value) async {
    _map[key] = value;
    return Tuple(key, value);
  }

  Future<Null> invalidate(K key) async {
    _map.remove(key);
  }

  Future<Null> invalidateAll() async {
    _map.clear();
  }
}