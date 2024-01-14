
 List<Map<String,dynamic>> products = [
  {
    'name':'PullOver',
    'color':'Black',
    'size':'L',
    'price' :51,
    'quantity':1,
    'image':'assets/images/1.png',
  },
  {
    'name':'T-Shirt',
    'color':'Grey',
    'size':'XL',
    'price' : 30,
    'quantity':1,
    'image':'assets/images/2.png',
  },
  {
    'name':'Sport Dress',
    'color':'Black',
    'size':'S',
    'price' :43,
    'quantity':1,
    'image':'assets/images/3.png',
  },

];

 int totalAmount =0;
 int calculateTotalAmount() {
  int sum=0;
  for(int i=0;i<products.length;i++)
    {
      sum += (products[i]['quantity'] as int)*(products[i]['price'] as int);
    }
  return sum;
}