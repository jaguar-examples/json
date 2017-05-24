// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar/jaguar.dart';
import 'package:jaguar/interceptors.dart';

@Api(path: '/api')
@WrapEncodeMapToJson()
class ExampleApi {
  @Get(path: '/hello')
  Map sayHello() => {
    "greeting": "Hello",
  };

  @Post(path: '/math')
  @WrapDecodeJsonMap()
  Map math(@Input(DecodeJsonMap) Map body) {
    int a = body['a'];
    int b = body['b'];

    return {
      'addition': a + b,
      'subtraction': a - b,
      'multiplication': a * b,
      'division': a ~/ b,
    };
  }
}