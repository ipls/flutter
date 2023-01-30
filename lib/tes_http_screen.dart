import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:belajar_no1/model/pokemon.dart';

class TesHttpScreen extends StatefulWidget {
  const TesHttpScreen({Key? key}) : super(key: key);

  @override
  State<TesHttpScreen> createState() => TesHttpScreenState();
}

class TesHttpScreenState extends State<TesHttpScreen> {

  Future<PokemonModel> getPokemonWithName(String pokemonName) async {
    var response = await http.get(Uri.https("pokeapi.co","/api/v2/pokemon/$pokemonName",));
    if (response.statusCode == 200){
      var responseBody = response.body;
      var decodedMapResponseBody = jsonDecode(
          responseBody);
      print(
        "Response Body Ability ${decodedMapResponseBody["abilities"]}"
      );
      var pokemonModel = PokemonModel.fromJson(
          jsonDecode(responseBody));
      return pokemonModel;
    } else {
      return PokemonModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test HTTP")),
      body: FutureBuilder(
        future: getPokemonWithName("ditto"),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nama: ${snapshot.data?.name ?? "Failed"}"),

                  ],
                ),
              ),);
        }
          return Center(child: Text("loading..."));
      },
    ),
    );
  }
}
