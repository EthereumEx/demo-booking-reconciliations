pragma solidity ^0.4.8;

contract Booking 
{
    string public referenceId;
    string public activeState;

    function Booking(string reference, address counterParty, uint price);
    function UpdateBooking(string reference, address counterParty, uint price); 
}
