import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'carteirinha.dart';
import 'pagina_inicial.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<CalendarioPage> createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedTime;
  int _selectedIndex = 0;

  List<String> horarios = [
    "08:00", "09:00", "10:00", "11:00", "13:00", "14:00", "15:00", "16:00"
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PaginaInicial()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CarteirinhaPage()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null);
  }

  bool isSelectable(DateTime day) {
    return day.isAfter(DateTime.now().subtract(const Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF222083),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                iconSize: 20,
                icon: const Icon(Icons.arrow_back, color: Color(0xFF222083)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Expanded(
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/foto_de_menu_suspenso.png'),
                  height: 40,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Agendamento:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            TableCalendar(
              locale: 'pt_BR',
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                if (isSelectable(selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: _selectedDay != null ? const Color(0xFF8DDFA1) : const Color(0xFF222083),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      "Selecione o horário:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: horarios.map((horario) {
                        return ChoiceChip(
                          label: Text(horario),
                          selected: _selectedTime == horario,
                          onSelected: (selected) {
                            setState(() {
                              _selectedTime = selected ? horario : null;
                            });
                          },
                          selectedColor: const Color(0xFF222083),
                          backgroundColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: _selectedTime == horario ? Colors.white : Colors.black,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Ação para o botão 'Seguir'
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF222083),
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'Seguir',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: 'Carteirinha',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF01C3CC),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }
}
