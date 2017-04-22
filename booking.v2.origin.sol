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

    function Booking(string reference, address externalParty, uint price) 
    {
        referenceId = reference;
        internalUpdateBooking(reference, msg.sender, externalParty, price);
    }

    function updateBooking(string reference, address externalParty, uint price) 
    {
        internalUpdateBooking(reference, msg.sender, externalParty, price);
    }

    function internalUpdateBooking(string reference, address me, address externalParty, uint price) private 
    {
    }
}
