using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimModel
{
    public class ClaimlistModel
    {
        public string ClientName { get; set; }
        public string ClaimNo { get; set; }
        public string patientName { get; set; }
        public string ProviderName { get; set; }

        public string ClaimStatus { get; set; }
        public decimal AllowedAmount { get; set; }
        public decimal PaidAmount { get; set; }
        public string LastComment { get; set; }
        public string AssignedTo { get; set; }
               
    }
}
