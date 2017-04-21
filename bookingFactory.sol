pragma solidity ^0.4.8;

contract Booking 
{
    address party1;
    address party2;
    uint party1Price;
    uint party2Price;
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

    function updateBooking(string reference, address externalParty, uint price) 
    {
        address me = tx.origin;
        bool party1 = me < externalParty;

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
            updateParty1(me, externalParty, price);
        }
        else
        {
            updateParty2(me, externalParty, price);
        }

        updateState();
    }

    function updateState() private
    {
        if (party1Price == 0)
        {
            activeState = "Incomplete";
        }
        else if (party2Price == 0)
        {
            activeState = "Incomplete";
        }
        else if (party1Price == party2Price)
        {
            activeState = "Agreed";
        }
        else 
        {
            activeState = "Disagreed";
        }
    }

    function updateParty1(address me, address externalParty, uint price) private
    {
        if (party2 == 0x0)
        {
            party2 = externalParty;
        }
        else if (party2 != externalParty)
        {
            throw;
        }

        if (party1 == 0x0)
        {
            party1 = me;
        }
        else if (party1 != me)
        {
            throw;
        }

        party1Price = price;
    }

    function updateParty2(address me, address externalParty, uint price) private
    {
        if (party1 == 0x0)
        {
            party1 = externalParty;
        }
        else if (party1 != externalParty)
        {
            throw;
        }

        if (party2 == 0x0)
        {
            party2 = me;
        }
        else if (party2 != me)
        {
            throw;
        }

        party2Price = price;
    }
}
