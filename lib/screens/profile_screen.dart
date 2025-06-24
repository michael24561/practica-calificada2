import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  bool _darkMode = false;
  int _selectedTabIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTabPressed(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkMode 
          ? ThemeData.dark().copyWith(
              primaryColor: Colors.blueGrey,
              cardTheme: CardTheme(
                color: Colors.blueGrey[800],
                elevation: 4,
              ),
            )
          : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi perfil'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.nightlight_round),
                  Switch(
                    value: _darkMode,
                    onChanged: (value) {
                      setState(() {
                        _darkMode = value;
                      });
                    },
                    activeColor: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Ocupa todo el ancho
            children: [
              // Sección Superior
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _darkMode
                        ? [Colors.blueGrey[800]!, Colors.blueGrey[600]!]
                        : [Colors.blue.shade400, Colors.green.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_placeholder.jpeg'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Cristopher Nolan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Texto centrado
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '421 345 321',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Nolan@gmail.com',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/editProfile');
                      },
                      child: const Icon(Icons.edit),
                      mini: true,
                    ),
                  ],
                ),
              ),
              
              // Sección de Suscripción
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, // Ocupa todo el ancho
                      children: [
                        const Text(
                          '1 Year of Unlimited Moviez',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'USD 50.00 / 1 Year',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Expired on 05/08/2025',
                          style: TextStyle(
                            color: Colors.red.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Pestañas Inferiores con animación
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _selectedTabIndex == 0 ? _animation.value : 1.0,
                          child: child,
                        );
                      },
                      child: TextButton(
                        onPressed: () => _onTabPressed(0),
                        style: TextButton.styleFrom(
                          foregroundColor: _selectedTabIndex == 0 
                              ? Theme.of(context).primaryColor 
                              : Colors.grey,
                        ),
                        child: Text(
                          'Watch History',
                          style: TextStyle(
                            fontWeight: _selectedTabIndex == 0 
                                ? FontWeight.bold 
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _selectedTabIndex == 1 ? _animation.value : 1.0,
                          child: child,
                        );
                      },
                      child: TextButton(
                        onPressed: () => _onTabPressed(1),
                        style: TextButton.styleFrom(
                          foregroundColor: _selectedTabIndex == 1 
                              ? Theme.of(context).primaryColor 
                              : Colors.grey,
                        ),
                        child: Text(
                          'Downloaded',
                          style: TextStyle(
                            fontWeight: _selectedTabIndex == 1 
                                ? FontWeight.bold 
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Lista de Películas
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildMovieItem('VENOM', 'HERE ARE YOURS ME?'),
                    _buildMovieItem('INTERSTELLAR', 'MURPH!!!'),
                    _buildMovieItem('INCEPTION', 'DON\'T THINK ABOUT ELEPHANTS'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildMovieItem(String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow, size: 32),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}