pragma solidity ^0.4.8;

contract Booking 
{
    struct BookingData
    {
        address principal;
        uint price;
    }

    BookingData party1;
    BookingData party2;
    string public referenceId;
    string public activeState;

    function Booking(string reference, address counterParty, uint price) 
    {
        referenceId = reference;
        internalUpdateBooking(reference, msg.sender, counterParty, price);
    }

    function UpdateBooking(string reference, address counterParty, uint price) 
    {
        internalUpdateBooking(reference, msg.sender, counterParty, price);
    }

    function InternalUpdateBooking(string reference, address me, address counterParty, uint price) private 
    {
    }
}
