import 'package:flutter/material.dart';
import 'package:perfil/models/mensaje_model.dart';

class MensajeWidget extends StatelessWidget {
  MensajeModel mensajeModel;

  MensajeWidget(this.mensajeModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.srcATop,
                  ),
                  fit: BoxFit.cover,
                  image: NetworkImage(mensajeModel.imageUrl),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mensajeModel.titulo,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    mensajeModel.detalle,
                    style: TextStyle(
                      color: Color(0xff64766f),
                      fontSize: 14,
                    ),
                  ),   
                ],
              ),
            ),
            SizedBox(width: 10),
            Icon(
              mensajeModel.estado ? Icons.check_circle : Icons.check_circle_sharp,
              color: mensajeModel.estado ? Colors.green : Colors.grey,
            ),
          ],
        ),
    );
  }
}
