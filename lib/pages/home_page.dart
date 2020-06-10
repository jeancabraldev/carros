import 'package:carros/model/car.dart';
import 'package:carros/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../model/car.dart';
import '../model/api_car.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  //Method body
  _body() {
    List<Carro> cars = CarApi.getCars();
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            Carro c = cars[index];
            return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto,
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      c.descricao,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
