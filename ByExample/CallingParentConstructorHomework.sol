// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract S {
    string public name;

    constructor(string memory _name){
        name = _name;
    }
}

contract T {
    string public test;

    constructor(string memory _test){
        test = _test;
    }
}

contract U is S,T{
    constructor(string memory _name,string memory _test) S(_name) T(_test)
    {

    }
}

contract BB is S("xiaomi"),T{
    constructor(string memory _test) T(_test){}
}

contract B0 is S,T {
    constructor(string memory _name,string memory _test) S(_name) T(_test){

    }
}

contract B2 is T,S{
    constructor(string memory _test,string memory _name)  T(_test) S(_name){

    }
}