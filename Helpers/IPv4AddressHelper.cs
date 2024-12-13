using System.Net;
using System;
//rename namespace GreyCorbel?

namespace GreyCorbel.Helpers
{
    public static class IPv4AddressHelper
    {
        /// <summary>
        /// Some nice description of GetNumber method...
        /// </summary>
        /// <param name="ipAddress"></param>
        /// <returns></returns>
        public static uint GetNumber(string ipAddress)
        {
            var parts = ipAddress.Split('/');
            var addr = System.Net.IPAddress.Parse(parts[0]);
            return (uint)IPAddress.NetworkToHostOrder(
                (int)System.BitConverter.ToUInt32(
                    addr.GetAddressBytes(), 0));
        }

        public static (uint,uint) GetRangeBoundaries(string range,string siteId)
        {
            try {
                var parts = range.Split('/');
                if (parts.Length != 2)
                    throw new ArgumentException($"Invalid format of ipv4Range in siteId {siteId}, range: {range}");
                var low = GetNumber(parts[0]);
               
                int maskNumber = int.Parse(parts[1]);
                uint rangeSize = (uint)1 << (32-maskNumber);
                uint high = low + rangeSize-1;
                return (low, high);
            }
            catch (Exception ex)
            {
                throw new Exception($"Error - ipv4Range in siteId {siteId}, range: {range}. Exception: {ex.Message}");
            }
        }
        /// <summary>
        /// Some nice description of GetRangeBoundaries method...
        /// </summary>
        /// <param name="range"></param>
        /// <returns></returns>
        /// <exception cref="ArgumentException"></exception>
        public static (uint,uint) GetRangeBoundaries(string range)
        {
            var parts = range.Split('/');
            if (parts.Length != 2)
                throw new ArgumentException($"Invalid format of ipv4Range range: {range}");
            var low = GetNumber(parts[0]);
            int maskNumber = int.Parse(parts[1]);
            uint rangeSize = (uint)1 << (32-maskNumber);
            uint high = low + rangeSize-1;
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
