// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs{
    struct Car{
        string model;
        uint year;
        address owner;
    }

    //Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car("Toyota",1990,msg.sender);
        Car memory lambo  = Car({owner:msg.sender,year:1999,model:"lambp"});
        Car memory tesla;
        tesla.model = "tesla";
        tesla.year = 2000;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari",2022,msg.sender));

        Car storage _car = cars[0];
        _car.year = 2099;

        uint  x ;
        x = _car.year;

        toyota.year = 9999;

        delete _car.owner;
        delete cars[1];


    }




}