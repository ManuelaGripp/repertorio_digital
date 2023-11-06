import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio/app/controller/repertorio_controller.dart';

void main() {
  test('should have lenght equal to 0', () {
    RepertorioController repertorio = RepertorioController();
    expect(repertorio.list.length, 0);
  });
}
