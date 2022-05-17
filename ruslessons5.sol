//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo {
    uint public len;
//struct 
    struct Payment {
        uint amount;
        uint timestamp;
        address from;
        string message;
    }
    struct Balance{
        uint totalPayments;
        mapping(uint => Payment) payments; //здесь уже не нужно писать колдата, мемори или сторадж уже 
    }

    mapping(address => Balance) public balances;

    function getPayment(address _addr , uint _index) public view returns(Payment memory){
        return balances[_addr].payments[_index];


    }  
    
    function pay(string memory message) public payable {
        
        uint paymentNum = balances[msg.sender].totalPayments++;
        balances[msg.sender].totalPayments++; //хочу увелить количество платежей на единичку, 
 
        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp,
            msg.sender,
            message
            );
        balances[msg.sender].payments[paymentNum] = newPayment;

    
    }









//     //Array
// //  uint[10][5] public items; число 5 говорит о внешнем массиве, внутри которого элементы могут включать массивы длиной до 10 значений
//     uint[] public items; // юинт говорит о том каких типы данных 
//     //в массиве будут, но нельзая создать массив с разными типами данных
//     function demo() public {
//         items.push(4);
//         items.push(6);
//         len = items.length;
//     }

//     function sampleMemory() public view returns(uint[] memory) {
//         uint[] memory tempArray = new uint[](10);
//         tempArray[0] = 12;
//         return tempArray;


//     } 



//     //Enum
//     enum Status {Paid, Delivered, Received} //- список или массив, который при вызове будет выдавать индекс последнего значения
//     Status public currentStatus; //название перменной и того типа данных которому она принадлежит

//     function pay() public {
//         currentStatus = Status.Paid; // сначала пишем что тип переменной енам а потом уже прописаваем ее paid, del и тд
//     }
//     function del() public{
//         currentStatus = Status.Delivered;
//     }


// }



