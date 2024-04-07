import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      title: 'Beautiful Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// implement the main page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // dummy data to feed the grid view
  // list of images
  final List<Map<String, dynamic>> _images = [
    {
      'id': 'i1',
      'title': 'One',
      'url':
          'https://images.unsplash.com/photo-1621360841013-c7683c659ec6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fDNkJTIwYXNzZXRzfGVufDB8fDB8fHww'
    },
    {
      'id': 'i2',
      'title': 'Two',
      'url':
          'https://images.unsplash.com/photo-1676206584909-c373cf61cefc?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fDNkJTIwYXNzZXRzfGVufDB8fDB8fHww'
    },
    {
      'id': 'i3',
      'title': 'Three',
      'url':
          'https://images.unsplash.com/photo-1651649507836-8f84ca48a35c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fDNkJTIwYXNzZXRzfGVufDB8fDB8fHww'
    },
    {
      'id': 'i4',
      'title': 'Four',
      'url':
          'https://images.unsplash.com/photo-1633643092028-b66187af7d47?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fDNkJTIwYXNzZXRzfGVufDB8fDB8fHww'
    },
    {
      'id': 'i5',
      'title': 'Five',
      'url':
          'https://images.unsplash.com/photo-1634025151266-4773d6189169?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjN8fDNkJTIwYXNzZXRzfGVufDB8fDB8fHww'
    },
    {
      'id': 'i6',
      'title': 'Six',
      'url':
          'https://images.unsplash.com/photo-1634926878768-2a5b3c42f139?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzl8fDNkJTIwYXNzZXRzfGVufDB8fDB8fHww'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Beatiful Gallery')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        // implement the grid view
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: _images.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                key: ValueKey(_images[index]['id']),
                // navigate to the detail page on tap
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      // pass the image data to the detail page
                      builder: (context) => DetailPage(_images[index])));
                },
                // implement the Hero widget
                child: Hero(
                  // important: the tag
                  tag: _images[index]['id'],
                  // display the image
                  child: Image.network(
                    _images[index]['url'],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      ),
    );
  }
}

// detail page
class DetailPage extends StatelessWidget {
  // get the image data that was passed from the main page
  final Map image;
  const DetailPage(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // implement the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(image['title']),
        actions: [
          // this button does the same thing as the back button
          // I put it here to show you how to go back to the previous screen by implementing your own code
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: Center(
        // implement the Hero widget
        child: Hero(
          // important: the tag
          tag: image['id'],
          child: Image.network(image['url']),
        ),
      ),
    );
  }
}
