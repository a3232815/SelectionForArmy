//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace שרת_שנה_ג.ef
{
    using System;
    using System.Collections.Generic;
    
    public partial class Person_tb
    {
        public Person_tb()
        {
            this.CoronaDetails_tb = new HashSet<CoronaDetails_tb>();
        }
    
        public string PersonId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int CityId { get; set; }
        public int StreetId { get; set; }
        public short HouseNumber { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string phone { get; set; }
        public string MobilePhone { get; set; }
        public Nullable<int> ImageId { get; set; }
    
        public virtual City_tb City_tb { get; set; }
        public virtual ICollection<CoronaDetails_tb> CoronaDetails_tb { get; set; }
        public virtual Image_tb Image_tb { get; set; }
        public virtual Street_tb Street_tb { get; set; }
    }
}