// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:jaguar/jaguar.dart';

@Api(path: '/api')
class ExampleApi {
  /// This route shows how to write JSON response in jaguar.dart.
  /// [Response] class has a static constructor method called [json]. This
  /// method encodes the given Dart built-in object to JSON string
  @Get(path: '/hello')
  Response<String> sayHello(Context ctx) => Response.json({
        "greeting": "Hello",
      });


  /// This route shows how to read JSON request and write JSON response in
  /// jaguar.dart.
  @Post(path: '/math')
  Future<Response<String>> math(Context ctx) async {
    /// [bodyAsJsonMap] method on [Request] object can be used to decode JSON
    /// body of the request into Dart built-in object
    final Map body = await ctx.req.bodyAsJsonMap();
    final int a = body['a'];
    final int b = body['b'];

    return Response.json({
      'addition': a + b,
      'subtraction': a - b,
      'multiplication': a * b,
      'division': a ~/ b,
    });
  }
}
