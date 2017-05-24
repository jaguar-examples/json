// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';
import 'package:json/json.dart';

main() async {
  final api = new ExampleApi();

  final server = new Jaguar();
  server.addApi(reflectJaguar(api));
  await server.serve();
}
