import 'package:flutter/material.dart';

class UseraDataField extends StatelessWidget {
  final String label;
  final dynamic value;
  const UseraDataField({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 200,
        maxWidth: 300,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            value?.toString() ?? 'Not provided',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
