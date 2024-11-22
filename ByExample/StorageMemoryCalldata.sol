// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract StrogeMemoryCalldata{
    struct MyStruct{
        uint256[] arr;
        string str;
    }

    MyStruct[] public mystruct;

    uint[] public anOtherArr;
    
    

    function updateString(uint[] calldata arrInput,string memory stringInput) external{
    
    uint[] memory memoryArray =  new uint[](3);
    //memoryArray = [1,2,3];
    memoryArray[0] = 1;
    memoryArray[1] = 2;
    memoryArray[2] = 3;

    MyStruct memory example_1 = MyStruct(memoryArray,"xiaomi");
    MyStruct memory example_2  = MyStruct({str:"huarun",arr:memoryArray});
    MyStruct memory example_3;
    example_3.arr = memoryArray;
    example_3.str = "panke";

    mystruct.push(example_1);
    mystruct.push(example_2);
    mystruct.push(example_3);

    MyStruct storage example_4 = mystruct[1];
    example_4.str = stringInput;

    mystruct.push(MyStruct(arrInput,stringInput));
    getStructArr(arrInput);

    }


    function returnStruct(uint i) external view returns(uint256[] memory){
        return mystruct[i].arr;
    }

    // 2.另一个函数用于读取struct的整数数组成员，该函数的参数为整数数组，
    // 使用calldata存储数据位置，且在函数内部调用时，参数也使用calldata存储位置。

    function getStructArr(uint[] calldata y) private returns(uint[] memory) {
        anOtherArr = y;
    }


}
