import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_1/pages/donation.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';
import 'pages/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'VazirBold',
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'To Do Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final todoslist = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'لیست کارها',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30, 
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.only(bottom: 15),
                      ),
                      
                      for ( ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo, 
                          onToDoChanged: _handleToDoChange,
                          onDeleteIteml: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                            left: 20,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            )],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _todoController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: "چیزی بنویسید",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                        ),
                        child: ElevatedButton(
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                            
                          ),
                          onPressed: () {
                            _addToDoItem(_todoController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(60, 60),
                            elevation: 10,
                            backgroundColor: const Color.fromARGB(255, 24, 122, 27),
                            foregroundColor: Colors.white,
                        
                          ),
                        ),
                      )
                    ]),
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: const NavigationDrawer(),
    );
  }


  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      if (toDo != '') {
        todoslist.add(ToDo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
      } else {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: const Text(
              'ورودی نامعتبر است',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            content: const Text(
              'کادر را خالی نگذارید',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('متوجه شدم'),
                ),
              ),
            ],
          ),
        );
      }
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoslist;
    } else {
      results = todoslist
        .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
        .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
        ),
      child: TextField(
        textAlign: TextAlign.center,
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'جست و جو ',
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 143, 143, 143)
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              child: Image.asset('assets/nav_icon.png'),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: 18,
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
      runSpacing: 8, // Vertical Spacing
      children: [
        ListTile(
          leading: const Icon(
            Icons.home_outlined,
          ),
          title: const Text(
            "صفحه اصلی",
            textAlign: TextAlign.right,
          ),
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const MyApp(),
          )),
        ),

        const Divider(
          color: Colors.black12,
        ),

        ListTile(
          leading: const Icon(
            Icons.question_mark_outlined,
          ),
          title: const Text(
            "درباره ما",
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AboutUsPage(),
            ));
          },
        ),

        const Divider(
          color: Colors.black12,
        ),

        ListTile(
          leading: const Icon(
            Icons.handshake_outlined,
          ),
          title: const Text(
            "حمایت از ما",
            textAlign: TextAlign.right,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DonationPage()));
          },
        ),

        ListTile(
          contentPadding: EdgeInsets.only(top: 410),
          title: const Text(
            "نسخه برنامه : 1.0.1",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        
      ],
    ));
  }
}