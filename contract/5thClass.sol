// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Marketplace {

    //Product
        struct Product{
        uint256 id;
        string name;
        uint256 price;
        address seller;
        bool isAvailable;
    }

        Product[] public products;
    mapping(uint256 => Product) public productById;

    function addProduct(string memory name, uint256 price)  public returns(uint256){
        uint256 productId = products.length;

        Product memory newProduct = Product({
            id: productId,
            name: name,
            price: price,
            seller: msg.sender,
            isAvailable: true
        });

        products.push(newProduct);
        productById[productId] = newProduct;

        return productId;
    }

    function updateProductName(uint256 productId, string memory newName, uint256 newPrice) public {
        Product storage product = productById[productId];
        product.name = newName;
        product.price = newPrice;

        Product memory tempProduct = productById[productId];
        tempProduct.name = "I am nothing";
    }

    //Order

    enum OrderStatus {Pending, Paid, Confirmed,  Shipped, Delivered, Cancelled }

    struct Order {
        uint256 id;
        address buyer;
        uint256 productId;
        uint256 timestamp;
        OrderStatus status;
    }

    mapping(uint256 => Order) public orders;

    function createOrder(uint256 productId) public payable {
        uint256 orderId = block.timestamp;

        orders[orderId] = Order ({
            id: orderId,
            buyer: msg.sender,
            productId: productId,
            timestamp: block.timestamp,
            status: OrderStatus.Pending
        });
    }



    function updateOrderStatus(uint256 orderId, OrderStatus newStatus) public {
        require(orders[orderId].buyer == msg.sender, "This is not your order");

        OrderStatus currentStatus = orders[orderId].status;
        require(isValidTransition(currentStatus, newStatus), "Invalid Transition");


        orders[orderId].status = newStatus;
    }

    function isValidTransition(OrderStatus from, OrderStatus to) public pure returns (bool){
        if (from == OrderStatus.Pending) return to == OrderStatus.Paid || to == OrderStatus.Cancelled;
        if (from == OrderStatus.Paid) return to == OrderStatus.Confirmed || to == OrderStatus.Cancelled;
        if (from == OrderStatus.Confirmed) return to == OrderStatus.Shipped || to == OrderStatus.Cancelled;
        if (from == OrderStatus.Shipped) return to == OrderStatus.Delivered;

        return false;
    }
}