using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimModel
{
    public class ClaimDetailsModel
    {
        public string CPTHCPC { get; set; }
        public decimal? AllowedAmount { get; set; }
        public decimal? PaidAmount { get; set; }
    }
}
