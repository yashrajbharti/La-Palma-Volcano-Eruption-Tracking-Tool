import 'package:LaPalmaVolcanoEruptionTrackingTool/codingapp/kml/LookAt.dart';

class Flyto {
  LookAt lookAt;

  Flyto(this.lookAt);

  generateFlyto() {
    return 'flytoview=${this.lookAt}';
  }
}
