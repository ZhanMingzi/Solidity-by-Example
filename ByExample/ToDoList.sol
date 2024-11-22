// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ToDoList{

    struct ToDo{
    string text;
    bool completed;
    }

    ToDo[] public ToDoArray;

    function create() external {
        ToDo memory Task1 = ToDo("Task1",true);
        ToDo memory Task2 = ToDo({text:"Task2",completed:false});
        ToDo memory Task3;
        Task3.text = "Task3";
        Task3.completed = false;

        ToDoArray.push(Task1);
        ToDoArray.push(Task2);
        ToDoArray.push(Task3);

        ToDoArray.push(ToDo("Task4",false));

    }

    function update(string memory Str,uint Index) external {

        ToDo storage TempTask = ToDoArray[Index];

        TempTask.text = Str;

    }

    function toggleCompleted(uint Index)external{
        ToDo storage TempTask = ToDoArray[Index];

        TempTask.completed = !TempTask.completed;
    }

}
