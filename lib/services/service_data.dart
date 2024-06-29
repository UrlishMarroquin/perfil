import 'package:perfil/models/mensaje_model.dart';

class ServiceData {
  Future<List<MensajeModel>> getMensajes() {
    return Future.delayed(Duration(seconds: 5), () {
      return [mensaje1, mensaje2, mensaje3];
    });
  }
}
