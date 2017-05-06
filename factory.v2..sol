pragma solidity ^0.4.8;

contract Test
{
    string Name;

    function Test(string name)
    {
        Name = name;
    }
}

contract BookingFactory
{
    mapping(address => mapping(address => mapping(string => address))) lookup;

    function CreateOrUpdateBooking(string reference, address counterParty, uint price)
    {
        address contractLocation = GetBookingAddress(reference, msg.sender, counterParty);

        if (contractLocation == 0x0)
        {
            var (first,second) = Normalize(msg.sender, counterParty);
            contractLocation = new Test(reference);
            lookup[first][second][reference] = contractLocation;
        }
    }

    function GetBookingAddress(string reference, address currentParty, address counterParty) constant returns(address)
    {
        var (first,second) = Normalize(currentParty, counterParty);
        return lookup[first][second][reference];
    }

    function Normalize(address currentParty, address counterParty) private constant returns (address, address)
    {
        address first = currentParty;
        address second = counterParty;

        if (currentParty > counterParty)
        {
            first = counterParty;
            second = currentParty;
        }

        return (first, second);
    }
}
