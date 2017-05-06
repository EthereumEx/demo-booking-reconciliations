pragma solidity ^0.4.8;

contract BookingFactory
{
    function CreateOrUpdateBooking(string reference, address counterParty, uint price);
    function GetBookingAddress(address me, string reference, address counterParty) constant; 
}
