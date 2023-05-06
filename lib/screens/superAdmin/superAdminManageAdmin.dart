import 'package:flutter/material.dart';
import 'package:mbus/components/button_style.dart';
import 'package:mbus/providers/hexColor.dart';

class Admin {
  final String name;
  final String email;

  Admin({
    required this.name,
    required this.email,
  });
}

class SuperAdminManageAdmin extends StatefulWidget {
  const SuperAdminManageAdmin({Key? key}) : super(key: key);

  @override
  _SuperAdminManageAdminState createState() => _SuperAdminManageAdminState();
}

class _SuperAdminManageAdminState extends State<SuperAdminManageAdmin> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final List<Admin> _admins = [];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _addAdmin() async {
    if (_formKey.currentState!.validate()) {
      final adminData = Admin(
        name: _nameController.text,
        email: _emailController.text,
      );

      setState(() {
        _admins.add(adminData);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Admin added successfully'),
          backgroundColor: Colors.green,
        ),
      );
      _nameController.clear();
      _emailController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter admin name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: hexYellow,
                        ),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter admin name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter admin email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: hexYellow,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter admin email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: _addAdmin,
                  child: Text('Add Admin'),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Text(
            'Admins List',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: _admins.length,
              itemBuilder: (BuildContext context, int index) {
                final admin = _admins[index];
                return Card(
                  child: ListTile(
                    title: Text(admin.name),
                    subtitle: Text(admin.email),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _admins.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Admin deleted successfully'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
