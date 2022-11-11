import 'package:fluent_ui/fluent_ui.dart';
import 'package:news_app/models/article_category.dart';
import 'package:news_app/models/news_page.dart';
import 'package:news_app/widgets/news_list.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitle('Talha Solutions');
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setSize(const Size(755, 545));
    await windowManager.setMinimumSize(const Size(755, 545));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setSkipTaskbar(false);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Talha Solutions',
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.orange,
      ),
      home: const MyHomePage(title: "Talha Solutions"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {
  int index = 0;
  final viewKey = GlobalKey();
  final List<NewsPage> pages = [
    NewsPage(
      title: "Top Headlines",
      iconData: FluentIcons.news,
      category: ArticleCategory.general,
    ),
    NewsPage(
      title: "Business",
      iconData: FluentIcons.business_center_logo,
      category: ArticleCategory.business,
    ),
    NewsPage(
      title: "Technology",
      iconData: FluentIcons.laptop_secure,
      category: ArticleCategory.technology,
    ),
    NewsPage(
      title: "Entertainment",
      iconData: FluentIcons.my_movies_t_v,
      category: ArticleCategory.entertainment,
    ),
    NewsPage(
      title: "Sports",
      iconData: FluentIcons.more_sports,
      category: ArticleCategory.sports,
    ),
    NewsPage(
      title: "Science",
      iconData: FluentIcons.communications,
      category: ArticleCategory.science,
    ),
    NewsPage(
      title: "Health",
      iconData: FluentIcons.health,
      category: ArticleCategory.health,
    ),
  ];

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      key: viewKey,
      pane: NavigationPane(
        selected: index,
        onChanged: (value) {
          setState(() {
            index = value;
          });
        },
        displayMode: PaneDisplayMode.compact,
        items: pages
            .map<NavigationPaneItem>(
              (e) => PaneItem(
                icon: Icon(e.iconData),
                title: Text(e.title),
              ),
            )
            .toList(),
      ),
      content: NavigationBody.builder(
        index: index,
        itemBuilder: (context, index) {
          return NewsListPage(newsPage: pages[index]);
        },
      ),
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();

    if (isPreventClose) {
      showDialog(
        context: context,
        builder: (_) {
          return ContentDialog(
            title: const Text("Exit Confirmation"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              FilledButton(
                child: const Text("Yes"),
                onPressed: () {
                  Navigator.pop(context);
                  windowManager.destroy();
                },
              ),
              FilledButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
