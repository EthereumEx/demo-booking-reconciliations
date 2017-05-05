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
        updateBooking(reference, counterParty, price);
    }

    function UpdateBooking(string reference, address counterParty, uint price) {
        address me = tx.origin;
        bool party1 = me < counterParty;
        BookingData currentParty;
        
        if (party1)
        {
            currentParty = party1;
        }
        else
        {
            currentParty = party2;
        }

        if (currentParty.principal = 0x0)
        {
            currentParty.party1 = me;
        }

        currentParty.price = price;
        updateState();
    }

    function UpdateState() private
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
