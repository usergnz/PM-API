import 'package:flutter/material.dart';
import '../services/api_service.dart';

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();
  final ApiService apiService = ApiService();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      apiService
          .createUser(_nameController.text, _jobController.text)
          .then((response) {
        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('User created successfully')));
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Failed to create user')));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Pengguna')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jobController,
                decoration: InputDecoration(labelText: 'Job'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
