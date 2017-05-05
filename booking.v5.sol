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
        if (exernalParty = 0x0 || msg.sender == counterParty)
        {
            throw;
        }

        referenceId = reference;
        BookingData activeParty = party1;

        if (msg.sender > counterParty)
        {
            activeParty = party2;
            party1.principal = exernalParty;
        }
        else
        {
            party2.principal = counterParty;
        }

        activeParty.principal = msg.sender;
        activeParty.price = price;
    }

    function updateBooking(string reference, address counterParty, uint price) 
    {
        internalUpdateBooking(reference, msg.sender, counterParty, price);
    }

    function internalUpdateBooking(string reference, address me, address counterParty, uint price) private 
    {
        if (referenceId != reference)
        {
            throw;
        }

        BookingData currentParty = party1;
        
        if (me > counterParty)
        {
            currentParty = party2;
        }

        verifyPartyUpdatePrice(me, currentParty, price);
        updateState();
    }

    function verifyPartyUpdatePrice(address me, BookingData data, uint price) private
    {
        if (data.principal != me)
        {
            throw;
        }

        data.price = price;
    }

    function updateState() private
    {
        if (party1.principal == 0x0)
        {
            activeState = "Incomplete";
        }
        else if (party2.principal == 0x0)
        {
            activeState = "Incomplete";
        }
        else if (party1.price == party2.price)
        {
            activeState = "Agreed";
        }
        else 
        {
            activeState = "Disagreed";
        }
    }
}
