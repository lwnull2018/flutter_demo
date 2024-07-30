import 'package:flutter/material.dart';

class Product {
  final String title;//商品标题
  final String description;//商品描述
  Product(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: '导航的数据传递和接收',
    home: ProductList(
      products: List.generate(20, (index) => Product('小马哥123：商品 $index', '这是一个商品详情 编号：$index')), key: const Key('123'),
    ),
  ));
}

class ProductList extends StatelessWidget {

  final List<Product> products;

  //构造函数
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('商品列表123')),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].title),
              onTap: () {//响应事件
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=>ProductDetail(product:products[index])
                  )
                );
              }
            );
      }),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Center(child: Text(product.description)),
    );
  }

}

