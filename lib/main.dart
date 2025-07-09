import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const QuoteScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  String _quote = "";
  String _author = "";
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final response = await http.get(
        Uri.parse("https://dummyjson.com/quotes/random"),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _quote = data['quote'];
          _author = data['author'];
          _loading = false;
        });
      } else {
        setState(() {
          _error = "Failed to load quote.";
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = "Something went wrong. Please try again.";
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text("📖 Random Quote Generator"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _loading
              ? const CircularProgressIndicator()
              : _error != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_error!, style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: fetchQuote,
                      child: const Text("Retry"),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '"$_quote"',
                      style: const TextStyle(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "- $_author",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: fetchQuote,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Get Another Quote"),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
