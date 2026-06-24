import 'package:flutter/material.dart';
import 'package:pertemuan10_2306008/models/product_model.dart';
import 'dart:convert';


class ProductCart extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelet;




  const ProductCart({super.key, required this.product, required this.onTap, this.onEdit, this.onDelet});

 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
      margin: EdgeInsets.only(top: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          product.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text("Rp ${product.price}"),
              const SizedBox(height: 5),
              product.image.isNotEmpty
                  ? Image.memory(
                      base64Decode(product.image),
                      width: 120,
                      height: 130,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image, size: 120, color: Colors.grey),
            ],
          ),
        leading: onEdit!= null ?  IconButton(
          onPressed: onEdit,
          icon: Icon(Icons.edit, color: Colors.blue),
        ) : null,
        trailing: onDelet != null? IconButton(
          onPressed: onDelet,
          icon: Icon(Icons.delete, color: Colors.red),
        ) : null,
      ),
      ),
    );
  }
}