// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
private
public 
external
internal
*/

contract A {
    uint private pri_int;
    uint internal inter_int;
    //uint external exter_int;
    uint public pub_int;

    function pri_func() private pure returns(uint){
        return 1;
    }

    function inter_func() internal pure returns(uint){
        return 1;
    }

    function pub_func() public pure returns(uint){
        return 1;
    }

    function exter_func() external  pure returns(uint){
        return 1;
    }

    function call_func_test() public pure {
        //exter_func();
        inter_func();
        pub_func();
        pri_func();
    }

    function use_vai_test_A() public {
        pri_int++;
        inter_int++;
        pub_int++;

    }

}

contract B is A {

    function use_vai_test_B()external view{
        inter_int + pub_int; //+ pri_int;

        //pri_func();
        inter_func();
        //exter_func();
        pub_func();

    }
}

contract C{

        function use_vai_test_C()external view{
        //inter_int + pub_int + pri_int;

       // pri_func();
       // inter_func();
       //exter_func();
       // pub_func();

    }


}

