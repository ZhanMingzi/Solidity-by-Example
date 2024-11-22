// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract OrderByUsingEnum{
    enum OrderStatus{
        None,
        Penging,
        Shipped,
        Completed,
        Rejected,
        Cancelled
    }

    OrderStatus public orderstatus;

    struct Order{
        OrderStatus orderstatus;
        address buyer;
    }

    Order[] public orders;

    function addOrder(OrderStatus stus,address buyer) public {
        orders.push(Order(stus,buyer));

    }

    function updateOrderStatus(uint orderindex,OrderStatus status) public {
        Order storage tempOrder = orders[orderindex];
        tempOrder.orderstatus = status;
    }

    function getOrderStatus(uint orderindex) public  view returns(OrderStatus){
         Order storage tempOrder = orders[orderindex];
         return tempOrder.orderstatus;
    }

    function resetOrderStatus(uint orderindex) public {
        Order storage tempOrder = orders[orderindex];
         delete tempOrder.orderstatus;
    }
}