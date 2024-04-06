import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptonique',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cryptonique'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Cryptonique',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Symmetric'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SymmetricPage()));
              },
            ),
            ListTile(
              title: Text('Asymmetric'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AsymmetricPage()));
              },
            ),
            ListTile(
              title: Text('Hashing'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HashingPage()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to Cryptonique!'),
      ),
    );
  }
}

class SymmetricPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symmetric'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Additive Cipher'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CryptoOperationPage('Additive Cipher')));
            },
          ),
          ListTile(
            title: Text('Multiplicative Cipher'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CryptoOperationPage('Multiplicative Cipher')));
            },
          ),
          ListTile(
            title: Text('Affine Cipher'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CryptoOperationPage('Affine Cipher')));
            },
          ),
          ListTile(
            title: Text('Auto Key Cipher'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CryptoOperationPage('Auto Key Cipher')));
            },
          ),
          ListTile(
            title: Text('Playfair Cipher'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CryptoOperationPage('Playfair Cipher')));
            },
          ),
          ListTile(
            title: Text('Hill Cipher'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CryptoOperationPage('Hill Cipher')));
            },
          ),
        ],
      ),
    );
  }
}

class AsymmetricPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asymmetric'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('RSA'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CryptoOperationPage('RSA')));
            },
          ),
          ListTile(
            title: Text('Diffie Hellman'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CryptoOperationPage('Diffie Hellman')));
            },
          ),
        ],
      ),
    );
  }
}

class HashingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hashing'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('SHA'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CryptoOperationPage('SHA')));
            },
          ),
          ListTile(
            title: Text('MD5'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CryptoOperationPage('MD5')));
            },
          ),
          ListTile(
            title: Text('SHA-256'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CryptoOperationPage('SHA-256')));
            },
          ),
        ],
      ),
    );
  }
}

class CryptoOperationPage extends StatelessWidget {
  final String algorithm;

  CryptoOperationPage(this.algorithm);

  TextEditingController textController = TextEditingController();
  TextEditingController keyController = TextEditingController();

  void encryptData(String text, String key) {
    // Add encryption logic based on the selected algorithm
    print('Encrypting: $text with key: $key using $algorithm');
    // Implement encryption logic here
  }

  void decryptData(String text, String key) {
    // Add decryption logic based on the selected algorithm
    print('Decrypting: $text with key: $key using $algorithm');
    // Implement decryption logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(algorithm),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              algorithm,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Enter plain/cipher text',
              ),
            ),
            if (algorithm != 'RSA' && algorithm != 'Diffie Hellman')
              SizedBox(height: 20),
            TextField(
              controller: keyController,
              decoration: InputDecoration(
                hintText: 'Enter key',
              ),
            ),
            if (algorithm == 'RSA' || algorithm == 'Diffie Hellman')
              Column(
                children: [
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter public key',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter private key',
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    encryptData(textController.text, keyController.text);
                  },
                  child: Text('Encrypt'),
                ),
                ElevatedButton(
                  onPressed: () {
                    decryptData(textController.text, keyController.text);
                  },
                  child: Text('Decrypt'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
