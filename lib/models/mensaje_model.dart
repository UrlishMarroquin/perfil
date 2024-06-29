class MensajeModel {
  String titulo;
  String detalle;
  bool estado;
  String imageUrl;
  MensajeModel({
    required this.titulo,
    required this.detalle,
    required this.estado,
    required this.imageUrl,
  });
}

MensajeModel mensaje1 = MensajeModel(
    titulo: "Ir de compras al super",
    detalle: "No te olvides de llevar la lista",
    estado: false,
    imageUrl:
        "https://www.ecommercenews.pe/wp-content/uploads/2023/02/Holi.jpg");
MensajeModel mensaje2 = MensajeModel(
    titulo: "Llevar las cosas a la casa",
    detalle: "Son cosas delicadas debes de tener cuidado",
    estado: true,
    imageUrl:
        "https://img.interempresas.net/fotos/2721723.png");
MensajeModel mensaje3 = MensajeModel(
    titulo: "Conseguir comida para la cena",
    detalle: "Debe ser bajo en grasas",
    estado: false,
    imageUrl:
        "https://www.ahorrafacil.es/wp-content/uploads/2024/02/conseguir-comida-gratis.jpg");
