// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
Inheritance tree

  E
 / \
F   G
\   /
  H 

*/

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

// contract E_1 {
//     event Log(string message);

//     function foo() public virtual {
//         emit Log("E_1.foo");
//     }

//     function bar() public virtual {
//         emit Log("E_1.bar");
//     }
// }


contract F is E {
    function foo() public virtual override{
        emit Log("F.foo");
        E.foo();//direct call function
    }

    function bar() public virtual override{
        emit Log("F.bar");
        super.bar();
    }
}

contract G is E {
    function foo() public virtual override {
        emit Log("G.foo");
        E.foo();
    }

    function bar() public virtual override {
        emit Log("G.bar");
        super.bar();
    }
}

contract H is F,G {
    function foo() public override (F,G){
        F.foo(); //F E
    }
    function bar() public override (F,G){
       super.bar();//F E ，G E
    }
}