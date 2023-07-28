using ClaimModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimEntity.Repo
{
    public class ClaimlistRepo
    {
        public List<ClaimlistModel> GetClaimlists()
        {
            using (AlgoZyEntities context = new AlgoZyEntities())
            {
                List<ClaimlistModel> ClaimDetails = context.Database.SqlQuery<ClaimlistModel>("EXEC GetClaimlist ", "").ToList();
                return ClaimDetails;
            }

        }
   
    }
}
