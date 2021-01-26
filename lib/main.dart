import 'package:flutter/material.dart';

void main() => runApp(TEP());

class TEP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Estado();
}

class Estado extends State{
  List<String> rom=[];
  TextEditingController romControlador;
  bool completa=false;

  @override
  Widget build(BuildContext context)=>MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(title: Text("TODO"),
              bottom: TabBar(
                tabs: [
                  Tab(text: "<-"),
                  Tab(text: "Me"),
                  Tab(text: "->"),
                ],
              ),
            ),
            body:
            TabBarView(
              children: [
                Text("Alguien"),
                romaOut(),
                Text("Ellos")
              ],
            )

        ),
      ));




  





  SafeArea romaOut() {
    return SafeArea(
      child: Column(
        children: [

          Expanded(
            child: ListView.builder(
                itemCount: rom.length,
                itemBuilder: (BuildContext context, int Index)=>
                    Card(
                      child: ListTile(
                        leading: Checkbox(value: completa,
                          onChanged: (valor){
                            setState(() {
                              rom.removeAt(Index);
                            });
                          },),
                        title: Text(rom[Index]),
                        trailing: IconButton(icon: Icon(Icons.share),),
                      ),
                    )//Text(roma[Index])
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: romControlador,
              decoration: InputDecoration(hintText: "Actividad",
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0)),
              ),

              onSubmitted: (valor){
                rom.insert(0, valor);
                setState(() {
                  //                 romaControlador.clear();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
