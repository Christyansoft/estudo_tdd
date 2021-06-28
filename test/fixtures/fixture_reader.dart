
import 'dart:io';

String readJson(String name) => File('test/fixtures/$name').readAsStringSync();