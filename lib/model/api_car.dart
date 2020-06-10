import '../model/car.dart';

class CarApi {
  static List<Carro> getCars() {
    final cars = List<Carro>();

    cars.add(
      Carro(
        nome: 'Ferrari FF',
        urlFoto:
            'https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Ferrari_FF.png',
        descricao: 'Descrição Ferrari FF',
      ),
    );
    cars.add(
      Carro(
        nome: 'AUDI GT Spyder',
        urlFoto:
            'https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Audi_Spyder.png',
        descricao: 'Descrição AUDI GT Spyder',
      ),
    );
    cars.add(
      Carro(
        nome: 'Lamborghini Aventador',
        urlFoto:
            'https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Lamborghini_Aventador.png',
        descricao: 'Descrição Lamborghini Aventador',
      ),
    );
    cars.add(
      Carro(
        nome: 'Maserati Grancabrio Sport',
        urlFoto:
        'https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Maserati_Grancabrio_Sport.png',
        descricao: 'Descrição Maserati Grancabrio Sport',
      ),
    );
    cars.add(
      Carro(
        nome: 'McLAREN MP4-12C',
        urlFoto:
        'https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/McLAREN.png',
        descricao: 'Descrição McLAREN MP4-12C',
      ),
    );
    return cars;
  }
}
