
//* https://app.quicktype.io/

class Welcome {
    int orderId;
    User user;
    List<Product> products;

    Welcome({
        this.orderId,
        this.user,
        this.products,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => new Welcome(
        orderId: json["orderId"],
        user: User.fromJson(json["user"]),
        products: new List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "user": user.toJson(),
        "products": new List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int productId;
    String productName;
    int quantity;
    int price;

    Product({
        this.productId,
        this.productName,
        this.quantity,
        this.price,
    });

    factory Product.fromJson(Map<String, dynamic> json) => new Product(
        productId: json["productId"],
        productName: json["productName"],
        quantity: json["quantity"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "quantity": quantity,
        "price": price,
    };
}

class User {
    String fullName;
    String email;

    User({
        this.fullName,
        this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => new User(
        fullName: json["fullName"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
    };
}
