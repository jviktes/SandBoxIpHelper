using System.Net;
using System;
namespace GreyCorbel.Helpers
{
public static class IPv6AddressHelper
    {
    
        public static System.Numerics.BigInteger GetNumber(IPAddress addr)
        {
            var arr = addr.GetAddressBytes();
            System.Array.Reverse(arr);
            return new System.Numerics.BigInteger(arr);
        }

        public static System.Numerics.BigInteger GetNumber(string ipAddress)
        {
            var parts = ipAddress.Split('/');
            var addr = System.Net.IPAddress.Parse(parts[0]);
            var arr = addr.GetAddressBytes();
            System.Array.Reverse(arr);
            return new System.Numerics.BigInteger(arr);
        }
        public static (System.Numerics.BigInteger,System.Numerics.BigInteger) GetRangeBoundaries(string range)
        {
            var parts = range.Split('/');
            if (parts.Length != 2)
                throw new ArgumentException("Invalid format of ipv6Range");
            var low = GetNumber(parts[0]);
            int maskNumber = int.Parse(parts[1]);
            System.Numerics.BigInteger rangeSize = (System.Numerics.BigInteger)1 << (128-maskNumber);
            System.Numerics.BigInteger high = low + rangeSize;
            return (low, high);
        }
        public static bool BelongsToRange(string ipAddress, string range)
        {
            var bounds = GetRangeBoundaries(range);
            var number = GetNumber(ipAddress);
            return number >=bounds.Item1 && number <= bounds.Item2;
        }
    }
}