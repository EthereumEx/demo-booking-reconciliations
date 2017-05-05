pragma solidity ^0.4.8;

contract Booking 
{
    address party1;
    address party2;
    uint party1Price;
    uint party2Price;
    string public referenceId;
    string public activeState;

    function Booking(string reference, address counterParty, uint price) 
    {
        if (tx.origin == counterParty)
        {
            throw;
        }
        referenceId = reference;
        updateBooking(reference, counterParty, price);
    }

    function updateBooking(string reference, address counterParty, uint price) 
    {
        address me = tx.origin;
        bool party1 = me < counterParty;

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
            updateParty1(me, counterParty, price);
        }
        else
        {
            updateParty2(me, counterParty, price);
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

    function updateParty1(address me, address counterParty, uint price) private
    {
        if (party2 == 0x0)
        {
            party2 = counterParty;
        }
        else if (party2 != counterParty)
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

    function updateParty2(address me, address counterParty, uint price) private
    {
        if (party1 == 0x0)
        {
            party1 = counterParty;
        }
        else if (party1 != counterParty)
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
