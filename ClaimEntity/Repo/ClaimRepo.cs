using ClaimModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimEntity.Repo
{
    public class ClaimRepo
    {
        
        public int GetclaimUnassigned()
        {
            using (AlgoZyEntities DBContext = new AlgoZyEntities())
            {
                return DBContext.Claims.Where(o => o.ClaimStatusId == 1).Count();
            }            
        }
        public int GetclaimAssigned()
        {
            using (AlgoZyEntities DBContext = new AlgoZyEntities())
            {
                return DBContext.Claims.Where(o => o.ClaimStatusId == 2).Count();
            }
           
            
        }
        public int GetclaimWIP()
        {
            using (AlgoZyEntities DBContext = new AlgoZyEntities())
            {
                return DBContext.Claims.Where(o => o.ClaimStatusId == 3).Count();
            }
           
            
        }

        public ClaimCount Getclaim()
        {
            using (AlgoZyEntities DBContext = new AlgoZyEntities())
            {
                ClaimCount UR = new ClaimCount();
                UR.ClaimUnassigned = DBContext.Claims.Where(o => o.ClaimStatusId == 1).Count();
                UR.ClaimAssigned = DBContext.Claims.Where(o => o.ClaimStatusId == 2).Count();
                UR.ClaimWIP = DBContext.Claims.Where(o => o.ClaimStatusId == 3).Count();
                return UR;
            }
        }

        public List<ClaimDetailsModel> GetClaimDetails(int ClaimID)
        {

            using (AlgoZyEntities DBContext = new AlgoZyEntities())
            {
                return DBContext.ClaimDetails.Where(o => o.ClaimId == ClaimID).Select(p => new ClaimDetailsModel()
                {
                    CPTHCPC = p.CPTHCPC,
                    AllowedAmount = p.AllowedAmount,
                    PaidAmount=p.PaidAmount
                }).ToList();
            }

        }

    }
}
