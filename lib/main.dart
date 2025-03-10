import 'package:flutter/material.dart';
import 'package:intelligent_medical_system/ui/Home/home_screen.dart';
import 'package:intelligent_medical_system/ui/Register/login_screen.dart';
import 'package:intelligent_medical_system/ui/Register/signup_screen.dart';
import 'package:intelligent_medical_system/ui/Splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        SplashScreen.routeName:(context)=>SplashScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        SignupScreen.routeName:(context)=>SignupScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FavoriteDrugs {
  static List<Map<String, dynamic>> favorites = [];
}

class AllDrugsScreen extends StatefulWidget {
  @override
  _AllDrugsScreenState createState() => _AllDrugsScreenState();
}

class _AllDrugsScreenState extends State<AllDrugsScreen> {
  List<dynamic> _drugs = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchDrugs();
  }

  Future<void> _fetchDrugs() async {
    try {
      final response = await http.get(Uri.parse('https://1474-196-159-72-17.ngrok-free.app/api/'));

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('data')) {
          setState(() {
            _drugs = List.from(decodedResponse['data']);
            _isLoading = false;
          });
        } else {
          throw Exception('Unexpected JSON format');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching drugs: $e');
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Drugs'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteScreen()),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _hasError
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Failed to load data. Please try again.'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _fetchDrugs,
              child: Text('Retry'),
            )
          ],
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _drugs.length,
        itemBuilder: (context, index) {
          final drug = _drugs[index];

          return Card(
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: Text(
                drug['MedicineName'] ?? 'Unknown',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Manufacturer: ${drug['Manufacturer'] ?? 'Not available'}\nPrice: ${drug['Price'] ?? 'N/A'}',
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: drug['ImageURL'] != null && drug['ImageURL']!.isNotEmpty
                    ? Image.network(
                  drug['ImageURL']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, color: Colors.red);
                  },
                )
                    : Icon(Icons.medical_services, size: 50, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrugDetails(drug: drug),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DrugDetails extends StatelessWidget {
  final Map<String, dynamic> drug;

  const DrugDetails({super.key, required this.drug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drug Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Drug Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 4)],
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Drug Name:', drug['MedicineName']),
                  _buildDetailRow('Active Ingredient:', drug['Composition']),
                  _buildDetailRow('Uses:', drug['Uses']),
                  _buildDetailRow('Side Effects:', drug['Side_effects']),
                  _buildDetailRow('Manufacturer:', drug['Manufacturer']),
                  _buildDetailRow('Price:', drug['Price']),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                if (!FavoriteDrugs.favorites.contains(drug)) {
                  FavoriteDrugs.favorites.add(drug);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${drug['MedicineName']} added to favorites!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              icon: Icon(Icons.favorite, color: Colors.white),
              label: Text('Add to Favorite', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(text: '$title ', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value ?? 'Not available'),
          ],
        ),
      ),
    );
  }
}

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Drugs")),
      body: ListView.builder(
        itemCount: FavoriteDrugs.favorites.length,
        itemBuilder: (context, index) {
          final drug = FavoriteDrugs.favorites[index];
          return ListTile(
            title: Text(drug['MedicineName']),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  FavoriteDrugs.favorites.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
*/
