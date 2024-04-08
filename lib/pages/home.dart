import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? _userToDo;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Buy Milk', 'Wash Dishes', 'Купи картоплю']);
  }

  void _menuOpen(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Menu'),),
          body: Row(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              }, child: const Text('On Main')),
              const Padding(padding: EdgeInsets.only(left: 15)),
              const Text('Simple Menu')
            ],),
        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('To do list'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _menuOpen, icon: const Icon(Icons.menu))
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
            key: Key(todoList[index]), 
            child: Card(
              child: ListTile(
                title: Text(todoList[index]),
                trailing: IconButton(
                  onPressed: (){
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ),
            onDismissed: (direction) {
              //if(direction == DismissDirection.startToEnd){
                setState(() {
                  todoList.removeAt(index);
                });
              //}
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: const Text('Add element'),
              content: TextField(
                onChanged: (String value){
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      todoList.add(_userToDo);
                    });
                    //_userToDo = '';
                    Navigator.of(context).pop();
                  }, 
                  child: const Text('Add'))
              ],
            );
          });
        },
        child: Icon(Icons.add_box, color: Colors.grey[900])
      ),
    );
  }
}