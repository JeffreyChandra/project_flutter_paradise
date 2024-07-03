import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart'; // Import geolocator package
import 'provider_data.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String searchQuery = "";

  void _showLocationDialog(BuildContext context) async {
    final _nameController = TextEditingController();
    final _addressController = TextEditingController();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Tambah Lokasi Baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama Lokasi'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Alamat Lokasi'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              final newLocation = Locations(  
                name: _nameController.text,
                address: _addressController.text,
                latitude: position.latitude,
                longitude: position.longitude,
              );
              Provider.of<LocationProvider>(context, listen: false)
                  .addLocation(newLocation);
              Provider.of<LocationProvider>(context, listen: false)
                  .setSelectedLocation(newLocation);
              Navigator.pop(context);
            },
            child: Text('Tambah'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var locations = Provider.of<LocationProvider>(context).locations;
    var filteredLocations = locations.where((location) {
      return location.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Lokasi'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Cari Lokasi',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredLocations[index].name),
                  onTap: () {
                    Provider.of<LocationProvider>(context, listen: false)
                        .setSelectedLocation(filteredLocations[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showLocationDialog(context);
            },
            child: Text('Tambahkan Lokasi Baru'),
          ),
        ],
      ),
    );
  }
}
