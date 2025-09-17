class MemoryCache {
  final _cache = <String, dynamic>{};

  void set(String key, dynamic value) => _cache[key] = value;
  dynamic get(String key) => _cache[key];
  bool contains(String key) => _cache.containsKey(key);
  void clear() => _cache.clear();
}
