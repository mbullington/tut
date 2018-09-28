// Copyright (c) 2018, Michael Bullington. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dartkit;

class Tuple<K, V> {
  final K one;
  final V two;

  const Tuple(this.one, this.two);
}

class Triple<M, N, O> {
  final M one;
  final N two;
  final O three;

  const Triple(this.one, this.two, this.three);
}