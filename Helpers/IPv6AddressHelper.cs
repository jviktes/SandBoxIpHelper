using System.Net;
using System;
namespace GreyCorbel.Helpers
{
public static class IPv6AddressHelper
    {
        /// <summary>
        /// Some nice description of GetNumber method...
        /// </summary>
        /// <param name="addr"></param>
        /// <returns></returns>
        public static System.Numerics.BigInteger GetNumber(IPAddress addr)
        {
            var arr = addr.GetAddressBytes();
            System.Array.Reverse(arr);
            return new System.Numerics.BigInteger(arr);
        }
        /// <summary>
        /// Some nice description of GetNumber method...
        /// </summary>
        /// <param name="ipAddress"></param>
        /// <returns></returns>
        public static System.Numerics.BigInteger GetNumber(string ipAddress)
        {
            var parts = ipAddress.Split('/');
            var addr = System.Net.IPAddress.Parse(parts[0]);
            var arr = addr.GetAddressBytes();
            System.Array.Reverse(arr);
            return new System.Numerics.BigInteger(arr);
        }
        /// <summary>
        /// Some nice description of GetRangeBoundaries method...
        /// </summary>
        /// <param name="range"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
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
        /// <summary>
        /// Some nice description of BelongsToRange method...
        /// </summary>
        /// <param name="ipAddress"></param>
        /// <param name="range"></param>
        /// <returns></returns>
        public static bool BelongsToRange(string ipAddress, string range)
        {
            var bounds = GetRangeBoundaries(range);
            var number = GetNumber(ipAddress);
            return number >=bounds.Item1 && number <= bounds.Item2;
        }
    }
}