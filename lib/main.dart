import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 10,
        navigateAfterSeconds: new MainMenuScreen(),
        image: new Image.asset('assets/logo.png'),
        backgroundColor: const Color(0xFFFFCC00),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 150.0,
        loaderColor: const Color(0xFF57150B));
  }
}

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "RU Fossil Park",
            style: TextStyle(color: const Color(0xFFFFCC00)),
          ),
          backgroundColor: const Color(0xFF57150B),
        ),
        body: new Container(
            color: const Color(0xFFFFCC00),
            child: new Center(
                child: new Column(
              children: <Widget>[
                new Container(
                  child: new Image.asset('assets/logo.png'),
                  margin: EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
                ),
                new Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: new InkWell(
                      child: new Text(
                        "About RU Fossil Park",
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()));
                      },
                    )),
                new Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: new Text(
                      'Fossils Found at RU Fossil Park',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                new Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: new InkWell(
                      child: new Text(
                        "Invertebrate Fossils",
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InvertebrateSelectionScreen()));
                      },
                    )),
                new Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: new InkWell(
                      child: new Text(
                        "Vertebrae Fossils",
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VertebraeSelectionScreen()));
                      },
                    )),
                new Container(
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: new InkWell(
                      child: new Text(
                        "Non-Fossils",
                        style: TextStyle(fontSize: 22),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NonFossilSelectionScreen()));
                      },
                    ))
              ],
            ))));
  }
}

class AboutScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
            child: WebviewScaffold(
      supportMultipleWindows: true,
      withJavascript: true,
      url: "https://www.rowan.edu/fossils/",
      appBar: new AppBar(
        title: new Text("RU Fossil Park",
            style: TextStyle(color: const Color(0xFFFFCC00))),
        backgroundColor: const Color(0xFF57150B),
      ),
    )));
  }
}

class InvertebrateSelectionScreen extends StatelessWidget {
  final List _fossils = [
    "Cucullaea (Clam)",
    "Crassatellites vadosus (Clam)",
    "Turritella vertebroides (Snail)",
    "Oleneothyris harlani (Brachiopod)",
    "Terebratulina atlantica (Brachiopod)",
    "Pycnodonte dissimilaris (Oysters)",
    "Gryphaeostrea vomeri (Oyster)",
    "Thalassinoides sp. Burrow",
    "Peridonella dichotoma (Sponge)",
    "Flabellum mortoni (Coral)"
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Invertebrate Fossils",
            style: TextStyle(color: const Color(0xFFFFCC00)),
          ),
          backgroundColor: const Color(0xFF57150B),
        ),
        body: new Container(
            color: const Color(0xFFFFCC00),
            child: new Column(
              children: <Widget>[
                new Expanded(
                    child: new ListView.builder(
                        itemCount: _fossils.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                              onTap: () {
                                int counter = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InvertebrateFossilInfoPage(
                                                counter)));
                              },
                              child: Card(
                                  color: const Color(0xFFFFCC00),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(_fossils.elementAt(index),
                                        style: TextStyle(fontSize: 22)),
                                  )));
                        }))
              ],
            )));
  }
}

class InvertebrateFossilInfoPage extends StatelessWidget {
  final List _fossils = [
    "Cucullaea (Clam)",
    "Crassatellites vadosus (Clam)",
    "Turritella vertebroides (Snail)",
    "Oleneothyris harlani (Brachiopod)",
    "Terebratulina atlantica (Brachiopod)",
    "Pycnodonte dissimilaris (Oysters)",
    "Gryphaeostrea vomeri (Oyster)",
    "Thalassinoides sp. Burrow",
    "Peridonella dichotoma (Sponge)",
    "Flabellum mortoni (Coral)"
  ];

  final List _fossilsDescription = [
    "This genus of clam is commonly called a false ark clam and spans the Cretaceous/Paleocene extinction at Edelman Fossil Park. The former mine workers here nicknamed these fossils as �squirrel heads� because of their shape. There are three species preserved at this locality: 1) Cucullaea neglecta - found in the Navesink Formation, 2) Cucullaea vulgaris - found in the lower Hornerstown Formation, and 3) Cucullaea macrodonta - found in upper Hornerstown Formation. Most guests find the common Cucullaea vulgaris. Its species name vulgaris (Latin for \"common\") refers to how frequently this fossil is found. The genus Cucullaea can still be found today and is canned in southeast Asia for human consumption. Like most invertebrate fossils preserved at Edelman Fossil Park, Cucullaea are preserved as internal casts, also known as steinkerns (German for \"stone center \")",
    "Crassatellites is the second most common clam found at Edelman Fossil Park, behind Cucullaea. Crassatellites are flatter than Cucullaea, have more pointed hinges, and smaller \"wing\" projecting behind the hinge. It is likely this clam filtered its food from the water and burrowed into the sand. Crassatellites, like most invertebrate fossils preserved at the site, are preserved as internal casts, also known as steinkerns (German for \"stone center \" )",
    "Turritella was a tall-spired snail that burrowed into the sand and filtered its food from the water. As a snail, it belongs to the class Gastropoda which means \"stomach foot\". Like most invertebrate fossils preserved at the Edelman Fossil Park, Turritella are preserved as internal casts, also known as steinkerns (German for \"stone center\")",
    "Although these fossils may look like clams, they are only distantly related. Oleneothyris belongs to the phylum Brachiopoda not Mollusca (which includes clams). The main difference between brachiopods and clams is that the former lacks symmetry about its hinge; the two valves of the shell are not identical in shape. The one hooks over the other to form the hinge. Brachiopods have existed for over 500 million years. The vast majority of brachiopods found at Edelman Fossil Park are Paleocene in age. Oleneothyris is the larger of the two brachiopod species found at Edelman Fossil Park and, like most invertebrate fossils preserved here, they are preserved as internal casts, also known as steinkerns (German for \"stone center\")",
    "Terebratulina is the smaller of the two brachiopod species found at Edelman Fossil Park. Although these fossils may look like clams they are only distantly related. Terebratulina belongs to the phylum Brachiopoda not Mollusca (which includes clams). The main difference between brachiopods and clams is that the former lacks symmetry about its hinge; the two valves of the shell are not identical in shape. The one hooks over the other to form the hinge. Brachiopods have existed for over 500 million years. The vast majority of brachiopods found at Edelman Fossil Park are Paleocene in age. Like most invertebrate fossils preserved here, they are preserved as internal casts, also known as steinkerns (German for \"stone center\")",
    "This is the only invertebrate preserved at Edelman Fossil Park that preserves as a fossil shell (not as a steinkern). Their shells have been replaced by tiny crystals of pyrite (commonly known as Fool's Gold). The pyrite crystals cause the fossil to look speckled with gold in the sunlight, especially when wet. Their shells are very fragile and are often recovered as fragments. Sometimes at Edelman Fossil Park Pycnodonte can be found preserved as an internal cast, also known as steinkern (German for \"stone center\")",
    "This is a second species of oyster found at the Edelman Fossil Park. Like other oysters, Gryphaeostrea was a filter feeder and ate tiny food particles in the water. It is shaped like a fingernail and, unlike Pycnodonte, is more common to be preserved as internal casts also known as steinkerns (German for \"stone center\") and not replaced with pyrite",
    "The sediment at the Edelman Fossil Park has been over 80% bio-turbated. This means that millions of years ago crustaceans dug burrows in the sea floor. Lobsters are the most likely taxa to have made these burrows as holes to live in. Some of these burrows have since filled and are preserved as casts or as the mud lining and remain hollow",
    "This is one of the most common fossils at Edelman Fossil Park. Sponges (Phylum: Porifera) are one of the oldest groups of multicellular animals on Earth, having evolved over 600 million years ago. They anchor themselves on the sea floor and are filter feeders. The fossils preserved at this site are usually tube like and sometimes branched. They preserve a patterned texture of very small holes, through which they circulated water to filter out bits of organic material",
    "Flabellum was a solitary horn coral unlike most colonial corals living today. As a coral, it had a symbiotic relationship with microorganisms"
  ];

  final List _fossilImages = [
    "cucullaea_vulgaris.png",
    "crassatellites_vadosus.png",
    "turitella.png",
    "oleneothyris_harlani.png",
    "terebratulina.png",
    "pycnodonte_dissimilaris.png",
    "gryphaeostrea_vomer.png",
    "combinedburrow.png",
    "peridonella_dichotoma.png",
    "flabellum_mortoni.png"
  ];

  final int counter;

  InvertebrateFossilInfoPage(this.counter);

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: FittedBox(
              child: new Text(
            _fossils.elementAt(counter),
            style: TextStyle(color: const Color(0xFFFFCC00)),
          )),
          backgroundColor: const Color(0xFF57150B),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            ),
            new Center(
                child: new Image.asset(
              "assets/" + _fossilImages.elementAt(counter),
              width: 250,
              height: 250,
            )),
            new Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            ),
            new Text("Details:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            new Text(_fossilsDescription.elementAt(counter),
                textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
          ],
        ));
  }
}

class VertebraeSelectionScreen extends StatelessWidget {
  int globalIndex;
  final List _fossils = [
    "Coprolites (Fossilized Poop)",
    "Otodus obliquus (Mackerel shark)",
    "Squalicorax pristodonthus (Crow Shark)",
    "Odontaspis cuspidata (Sand Tiger Shark)",
    "Cretolamna appendiculata (Mackerel shark)",
    "Enchodus ferox (Saber-Toothed Herring)",
    "Fish Fin Spine",
    "Fish Vertebra",
    "Shark Vertebra"
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Vertebrae Fossils",
            style: TextStyle(color: const Color(0xFFFFCC00)),
          ),
          backgroundColor: const Color(0xFF57150B),
        ),
        body: new Container(
            color: const Color(0xFFFFCC00),
            child: new Column(
              children: <Widget>[
                new Expanded(
                    child: new ListView.builder(
                        itemCount: _fossils.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                              onTap: () {
                                int counter = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VertebraeFossilInfoPage(counter)));
                              },
                              child: Card(
                                  color: const Color(0xFFFFCC00),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(_fossils.elementAt(index),
                                        style: TextStyle(fontSize: 22)),
                                  )));
                        }))
              ],
            )));
  }
}

class VertebraeFossilInfoPage extends StatelessWidget {
  final List _fossils = [
    "Coprolites (Fossilized Poop)",
    "Otodus obliquus (Mackerel shark)",
    "Squalicorax pristodonthus (Crow Shark)",
    "Odontaspis cuspidata (Sand Tiger Shark)",
    "Cretolamna appendiculata (Mackerel shark)",
    "Enchodus ferox (Saber-Toothed Herring)",
    "Fish Fin Spine",
    "Fish Vertebra",
    "Shark Vertebra"
  ];

  final List _fossilsDescription = [
    "Fecal matter occasionally fossilizes and can provide information on prehistoric diets. At Edelman Fossil Park, multiple types of coprolites are preserved. Shark coprolites are readily identifiable from their spiral shape as a result of the spiral shaped colon of sharks. Crocodile and turtle coprolites are more cylindrical.",
    "This mackerel shark is only found in the Paleocene at Edelman Fossil Park from about 60 to 45 million years ago. It can be larger than its older relative Cretolamna appendiculata that lived during the Cretaceous Period. Modern mackerel sharks are about 10ft in length, eat smaller fish, and are still found off the north east coast of the United States. Most of what we know about this fossil species comes from fossilized teeth as the cartilaginous skeletons of sharks do not preserve well.",
    "This prehistoric shark could grow up to 15 feet. Most of what we know about this species comes from fossilized teeth as the cartilaginous skeletons of sharks do not preserve well.",
    "Modern sand tiger sharks live in coastal regions worldwide and can reach lengths of up to 11 feet. Most of what we know about this species comes from fossilized teeth as the cartilaginous skeletons of sharks do not preserve well.",
    "This mackerel shark is only found in the Cretaceous at Edelman Fossil Park. It lived from about 90 to 50 million years ago around the world and is considered one of the most successful sharks in history. It is smaller than its younger relative Otodus obliquus that lived during the Paleocene. Modern mackerel sharks are about 10 feet in length, eat smaller fish, and are still found off the north east coast of the United States. Most of what we know about this species comes from fossilized teeth as the cartilaginous skeletons of sharks do not preserve well.",
    "The saber-toothed herring was a bony fish found worldwide from 90 to 50 million years ago. At Edelman Fossil Park we most commonly find teeth of this fish. After the fish had earned its nickname, scientists discovered it was actually more closely related to salmon than herring.",
    "These spines helped hold up the dorsal fin of a fish that lived millions of years ago. Many fish species used to live in ancient New Jersey, but few can be identified by a fin spine.",
    "This is a bone from the spine of an ancient fish. It is distinguished from a shark vertebra primarily by its hour-glass shape. Many fish species used to live in ancient New Jersey, but few can be identified by vertebrae.",
    "This is a bone from the spinal column of an ancient shark. Behind a shark's teeth, vertebrae are the next most common element of to fossilize. It is distinguished from a fish vertebra primarily by its hockey puck shape. Many shark species used to live in New Jersey, but few can be identified by vertebrae."
  ];

  final List _fossilImages = [
    "croc_coprolite.png",
    "otodus_obliquus.png",
    "squalicorax_pristodontus.png",
    "odontaspis_cuspidate.png",
    "cretolamna_appendiculata.png",
    "enchodus_ferox_tooth.png",
    "fish_spine.png",
    "fish_vertebra.png",
    "shark_vert.png"
  ];

  final int counter;

  VertebraeFossilInfoPage(this.counter);

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: FittedBox(
              child: new Text(
            _fossils.elementAt(counter),
            style: TextStyle(color: const Color(0xFFFFCC00)),
          )),
          backgroundColor: const Color(0xFF57150B),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            ),
            new Center(
                child: new Image.asset(
              "assets/" + _fossilImages.elementAt(counter),
              width: 250,
              height: 250,
            )),
            new Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            ),
            new Text("Details:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            new Text(_fossilsDescription.elementAt(counter),
                textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
          ],
        ));
  }
}

class NonFossilSelectionScreen extends StatelessWidget {
  int globalIndex;
  final List _fossils = [
    "Concretions",
    "Iron",
    "Vivianite (Mineral)",
    "Bacterial Precipitate (Bacteria Poop)",
    "Quartz (Mineral)"
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Non-Fossils",
            style: TextStyle(color: const Color(0xFFFFCC00)),
          ),
          backgroundColor: const Color(0xFF57150B),
        ),
        body: new Container(
            color: const Color(0xFFFFCC00),
            child: new Column(
              children: <Widget>[
                new Expanded(
                    child: new ListView.builder(
                        itemCount: _fossils.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                              onTap: () {
                                int counter = index;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NonFossilInfoPage(counter)));
                              },
                              child: Card(
                                  color: const Color(0xFFFFCC00),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(_fossils.elementAt(index),
                                        style: TextStyle(fontSize: 22)),
                                  )));
                        }))
              ],
            )));
  }
}

class NonFossilInfoPage extends StatelessWidget {
  final List _fossils = [
    "Concretions",
    "Iron",
    "Vivianite (Mineral)",
    "Bacterial Precipitate (Bacteria Poop)",
    "Quartz (Mineral)"
  ];

  final List _fossilsDescription = [
    "These are rocks that form by small sand and clay grains cementing together over time. Because of this they have a rough and grainy surface texture. The can be any random shape and usually are not symmetrical. Concretions are more common than fossils at the Edelman Fossil Park.",
    "The element iron precipitates from the ground water to form these red-orange, rusty colored rocks commonly called \"Bog Iron\". The orange color forms as a result of oxidation - the same process that causes rust to form on a car.",
    "This is an iron phosphate mineral and often blue and glassy when first found. But this mineral commonly reacts with the oxygen in the air (a process called 'oxidation'; the same process by which a car rusts) to turn white and crusty.",
    "Though not technically bacteria poop, this rock is a mineral precipitate that forms from the waste of the bacteria living in the ground water at Edelman Fossil Park. It is originally tan in color and looks like a sea sponge but is hard. It can be coated with an iron precipitate that is orange in color.",
    "This mineral is clear in color when pure but often picks up trace elements that make it any color. Quartz found at Edelman Fossil Park is often white, yellow, orange, or pink but other colors can be found. The quartz preserved at this site did not form in New Jersey. Instead it was picked up by the glaciers north of here during the last Ice Age and was deposited by the melt water of the receding glaciers at the top of the quarry. It then fell down to the quarry floor where guests can collect it."
  ];

  final List _fossilImages = [
    "concretions.png",
    "combinediron.png",
    "vivianite.png",
    "bacteriapoop.png",
    "quartz.png"
  ];

  final int counter;

  NonFossilInfoPage(this.counter);

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: FittedBox(
              child: new Text(
            _fossils.elementAt(counter),
            style: TextStyle(color: const Color(0xFFFFCC00)),
          )),
          backgroundColor: const Color(0xFF57150B),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            ),
            new Center(
                child: new Image.asset(
              "assets/" + _fossilImages.elementAt(counter),
              width: 250,
              height: 250,
            )),
            new Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            ),
            new Text("Details:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            new Text(_fossilsDescription.elementAt(counter),
                textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
          ],
        ));
  }
}
