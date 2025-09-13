// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Marketplace {
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
}