pragma solidity ^0.4.8;

contract BookingData
{
    address origin;
    address public principal;
    uint public price;

    function BookingData(address owner, uint currentPrice) 
    {
        principal = owner;
        origin = tx.sender;
        price = currentPrice;
    }

    function updatePrice(uint currentPrice)
    {
        if (origin != tx.sender)
        {
            throw;
        }
        else if(principal != tx.origin)
        {
            throw;
        }

        price = currentPrice;
    }
}

contract Booking 
{
    BookingData party1;
    BookingData party2;
    string public referenceId;
    string public activeState;

    function Booking(string reference, address externalParty, uint price) 
    {
        if (tx.origin == externalParty)
        {
            throw;
        }
        referenceId = reference;
        updateBooking(reference, externalParty, price);
    }

    function updateBooking(string reference, address externalParty, uint price) {
        address me = tx.origin;
        bool party1 = me < externalParty;
        BookingData currentParty;
        
        if (price == 0)
        {
            throw;
        }

        if (referenceId != reference)
        {
            throw;
        }
        
        if (party1)
        {
            if (party1 = 0x0)
            {
                party1 = new BookingData(price);
            }
            else
            {
                currentParty = party1;
            }
        }
        else
        {
            if (party2 = 0x0)
            {
                party2 = new BookingData(price);
            }
            else
            {
                currentParty = party2;
            }
        }

        if (currentParty != 0x0)
        {
            currentParty.updatePrice(price);
        }
    }

    function updateState() private
    {
        if (party1 == 0x0)
        {
            activeState = "Incomplete";
        }
        else if (party2 == 0x0)
        {
            activeState = "Incomplete";
        }
        else if (party1.price() == party2.price())
        {
            activeState = "Agreed";
        }
        else 
        {
            activeState = "Disagreed";
        }
    }
}
