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

contract U is S("s"),T("t") {}

contract v is S,T{
    constructor(string memory _name,string memory _test) S(_name) T(_test){

    }
}

contract VV is S("s"),T{
    constructor(string memory _test) T(_test){
        
    }
}