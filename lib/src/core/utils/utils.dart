final List<String> vehicleTypes = ['Carro', 'Moto', 'Caminhão'];

String convertRemoteVehicleType({required int vehicleType}) {
  switch (vehicleType) {
    case 1:
      return 'Carro';
    case 2:
      return 'Moto';
    case 3:
      return 'Caminhão';
    default:
      return '';
  }
}

String convertVehicleTypeString({required String vehicleType}) {
  switch (vehicleType) {
    case 'Carro':
      return 'carros';
    case 'Moto':
      return 'motos';
    case 'Caminhão':
      return 'caminhoes';
    default:
      return "";
  }
}
