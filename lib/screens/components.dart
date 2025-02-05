import 'package:flutter/material.dart';

class ComponentsScreen extends StatefulWidget {
  const ComponentsScreen({super.key});

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

class _ComponentsScreenState extends State<ComponentsScreen> {
  int counter = 0; // State variable for GestureDetector example
  TextEditingController _textController =
      TextEditingController(); // Controller for TextField

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Container Example
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              "This is a Container",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 10),

          // 2. Row Example
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.star, color: Colors.orange, size: 30),
              Icon(Icons.favorite, color: Colors.red, size: 30),
              Icon(Icons.thumb_up, color: Colors.blue, size: 30),
            ],
          ),
          SizedBox(height: 10),

          // 3. GestureDetector Example
          GestureDetector(
            onTap: () {
              setState(() {
                counter++;
              });
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Tap me! Count: $counter",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          SizedBox(height: 10),

          // 4. Stack Example
          Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.purple,
              ),
              Positioned(
                top: 30,
                left: 30,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.yellow,
                  child: Center(child: Text("Stacked")),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // 5. Padding Example
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "This text has padding around it.",
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 10),

          // 6. SizedBox Example
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("SizedBox Button"),
            ),
          ),
          SizedBox(height: 10),

          // 7. Expanded Example
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Expanded 2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "Expanded 1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // 8. Flexible Example
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  height: 50,
                  color: Colors.green,
                  child: Center(
                      child: Text("Flexible 1",
                          style: TextStyle(color: Colors.white))),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  height: 50,
                  color: Colors.orange,
                  child: Center(
                      child: Text("Flexible 2",
                          style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          // 9. TextField Example
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Display entered text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("You typed: ${_textController.text}"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }
}
