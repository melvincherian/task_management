import 'package:flutter/material.dart';
import 'package:task_management/features/presentation/pages/todos/add_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

  final List<String> _chipLabels = ['To-Do', 'Habit', 'Journal', 'Note'];
  bool _isFabExpanded = false;

  @override
  void dispose() {
    selectedIndexNotifier.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.04,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Text(
                    'Today',
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    'Mon 20 March 2024',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 106, 106, 106),
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Task',
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.04,
                        vertical: height * 0.02,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  ValueListenableBuilder<int>(
                    valueListenable: selectedIndexNotifier,
                    builder: (context, selectedIndex, child) {
                      return Wrap(
                        spacing: 10.0,
                        children: List<Widget>.generate(_chipLabels.length, (int index) {
                          return ChoiceChip(
                            label: Text(_chipLabels[index]),
                            selected: selectedIndex == index,
                            selectedColor: const Color.fromARGB(255, 255, 94, 0),
                            backgroundColor: Colors.white,
                            labelStyle: TextStyle(
                              color: selectedIndex == index ? Colors.white : Colors.grey,
                            ),
                            onSelected: (bool selected) {
                              if (selected) {
                                selectedIndexNotifier.value = index;
                              }
                            },
                            
                            
                          );
                          
                          
                        }),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Image.network(
                      height: 300,
                      width: 250,
                      'https://s3-alpha-sig.figma.com/img/cd49/b75f/1306490647a7cbec45cdc712cefc85aa?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mN9yDsxgLqMpZjeoUwEDVJ7EIEUZdezekBssmoqZc3vvcQ58Oojz~iEO6Ups~9kWUlWT6hXkdXo7CUR1rtEIRWtsdz8tZo3UyES74MdMgJV2QyEW8lLLZGURFcOgFmUq0cdtdsIpWRCxdFfdgXa-wAEG0m1mry~hUItYQEMNB8Dm~4jo2n3mLiCHGUtAHpK81PPmoCEvKRmCiosevtHNTRSLpGJbPVTru01wy7noTnHv5NwA1zcmxfjRSS4FL6E5ucjujEDAOxYmlUUB94bxRHXpyxEbo5ZgJFL69snyPOTgetxI55N~pc6KjW98CNSB94UVssPxNQjJHe6S0TzmAg__',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 88), // space for floating buttons
                ],
              ),
            ),
          ),

          // FAB section
          Positioned(
            bottom: 2,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (_isFabExpanded) ...[
                  _buildFabAction('Setup Journal',  () {},),
                  _buildFabAction('Setup Habit',  () {}),
                  _buildFabAction('Add List',  () {}),
                  _buildFabAction('Add Note', () {}),
                  _buildFabAction('Add Todo',  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodo()));
                  }),
                  const SizedBox(height: 8),
                ],
                SizedBox(height: 50,),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _isFabExpanded = !_isFabExpanded;
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 255, 77, 0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Icon(
                    _isFabExpanded ? Icons.close : Icons.add,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFabAction(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        // icon: Icon(icon, color: Colors.white, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 255, 77, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          elevation: 2,
        ),
      ),
    );
  }
}
