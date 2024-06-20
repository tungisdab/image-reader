import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imagePaths =
      List.generate(19, (index) => 'assets/images/a$index.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 250),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    imagePaths: imagePaths,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          itemCount: imagePaths.length,
        ),
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  final List<String> imagePaths;
  final int initialIndex;

  DetailScreen({required this.imagePaths, required this.initialIndex});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
      ),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10.0),
            child: Image.asset(widget.imagePaths[index]),
          );
        },
      ),
    );
  }
}

// class DetailScreen extends StatefulWidget {
//   final List<String> imagePaths;
//   final int initialIndex;

//   DetailScreen({required this.imagePaths, required this.initialIndex});

//   @override
//   _DetailScreenState createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   late PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: widget.initialIndex);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Detail'),
//       ),
//       body: ListView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         itemCount: widget.imagePaths.length,
//         itemBuilder: (context, index) {
//           return Center(
//             child: Image.asset(widget.imagePaths[index]),
//           );
//         },
//       ),
//     );
//   }
// }


// class DetailScreen extends StatefulWidget {
//   final List<String> imagePaths;
//   final int initialIndex;

//   DetailScreen({required this.imagePaths, required this.initialIndex});

//   @override
//   _DetailScreenState createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   late ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController(initialScrollOffset: widget.initialIndex * 500.0);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Detail'),
//       ),
//       body: ListView.builder(
//         controller: _scrollController,
//         itemCount: widget.imagePaths.length,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: const EdgeInsets.all(10.0),
//             child: Image.asset(widget.imagePaths[index]),
//           );
//         },
//       ),
//     );
//   }
// }