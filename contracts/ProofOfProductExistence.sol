pragma solidity ^0.4.4;

library Structures{
    struct Product {
        string name;
        string description;
        string manufacturer;
        string unique_id;
        bool exists;
    }
}

// Proof of Existence contract, version 3
contract ProofOfProductExistence {

    mapping (bytes32 => Structures.Product) private products;

    // store a product
    function _storeProduct(bytes32 id, Structures.Product product) private {
        products[id] = product;
    }
    // returns true if product is stored
    function _hasProof(bytes32 id) constant returns (bool) {
        return products[id].exists;
    }
    // helper function to get a unique_id's sha256
    function _calculateId(string unique_id) constant returns (bytes32) {
        return sha256(unique_id);
    }

    // calculate and store the proof for a document
    function create(string name, string description, string manufacturer, string unique_id) {
        var id = _calculateId(unique_id);
        if(products[id].exists) throw; // duplicate product

        var product = Structures.Product({
            name:name,
            description:description,
            manufacturer:manufacturer,
            unique_id: unique_id,
            exists: true
        });
        _storeProduct(id, product);
    }
    // get product
    function show(string unique_id) public constant returns (string, string, string, string){
        var id = _calculateId(unique_id);
        if(products[id].exists==false) throw; // product does not exists

        var product= products[id];
        return (product.name, product.description, product.manufacturer, product.unique_id);
    }
    // check if a product exists
    function hasProduct(string unique_id) constant returns (bool) {
        var id = _calculateId(unique_id);
        return _hasProof(id);
    }
}
