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
    
    public partial class manufacturerVaccine_tb
    {
        public manufacturerVaccine_tb()
        {
            this.CoronaDetails_tb = new HashSet<CoronaDetails_tb>();
        }
    
        public int manufacturerId { get; set; }
        public string manufacturer { get; set; }
    
        public virtual ICollection<CoronaDetails_tb> CoronaDetails_tb { get; set; }
    }
}