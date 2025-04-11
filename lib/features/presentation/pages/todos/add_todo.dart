import 'package:flutter/material.dart';
import 'package:task_management/features/presentation/pages/todos/custom_calender.dart';
import 'package:task_management/features/presentation/pages/todos/custom_time.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  void _showNewTodoSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 10,
            left: 20,
            right: 20,
          ),
          child: Container(
            height: 500,
            child: Column(
              children: [
                const Text(
                  'New Todo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'eg : Meeting with client',
                    border: InputBorder.none,
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final selectedDate = await showDialog<DateTime>(
                          context: context,
                          builder: (_) => const CustomCalendarDialog(),
                        );

                        if (selectedDate != null) {
                          print('Selected date: $selectedDate');
                        }
                      },
                      child:
                          const Icon(Icons.calendar_month, color: Colors.grey),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                        onTap: () async {
                          final selectedTime = await showDialog<String>(
                            context: context,
                            builder: (_) => const Dialog(
                              insetPadding: EdgeInsets.all(16),
                              child: CustomTimeWidget(),
                            ),
                          );

                          if (selectedTime != null) {
                            print('Selected time: $selectedTime');
                          }

                          const Icon(Icons.access_time, color: Colors.grey);
                        },
                        child: const Icon(Icons.alarm, color: Colors.grey)),
                    const SizedBox(width: 15),
                    GestureDetector(
                        onTap: () {

                        },
                        child: const Icon(Icons.flag, color: Colors.grey)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: const Icon(Icons.send,
                          color: Color.fromARGB(255, 255, 94, 0)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text(
              'Today',
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Mon 20 March 2024',
              style: TextStyle(
                color: const Color.fromARGB(255, 106, 106, 106),
                fontSize: width * 0.04,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => _showNewTodoSheet(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: const StadiumBorder(),
                ),
                child: const Text('Add New Todo'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
