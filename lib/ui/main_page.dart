import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_first_flutter/model/monster.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hive Database Demo")),
      body: FutureBuilder(
        future: Hive.openBox("monsters"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error),
              );
            } else {
              var monsters = Hive.box("monsters");
              if (monsters.length == 0) {
                monsters.add(Monster("Vampire", 1));
                monsters.add(Monster("Jelly Guardian", 5));
              }
              return ValueListenableBuilder(
                valueListenable: monsters.listenable(),
                builder:
                    (BuildContext context, Box<dynamic> value, Widget child) =>
                        Container(
                  margin: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: monsters.length,
                    itemBuilder: (context, index) {
                      Monster monster = monsters.get(index);
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(3, 3),
                                blurRadius: 6),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(monster.name +
                                " [" +
                                monster.level.toString() +
                                "]"),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.trending_up),
                                  color: Colors.green,
                                  onPressed: () {
                                    monsters.putAt(
                                      index,
                                      Monster(monster.name, monster.level + 1),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.content_copy),
                                  color: Colors.amber,
                                  onPressed: () {
                                    monsters.add(
                                      Monster(monster.name, monster.level),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    monsters.deleteAt(index);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
