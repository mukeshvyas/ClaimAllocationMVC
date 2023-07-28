using ClaimEntity.Repo;
using ClaimModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;

namespace ClaimAllocationAPI.Controllers
{
    public class ClaimController : ApiController
    {
        //
        // GET: /Claim/
        public  ClaimCount Getclaim()
        {
            ClaimRepo CR = new ClaimRepo();
            return CR.Getclaim();
           
        }
        public ClaimCount Getclaim(int ClaimId)
        {
            ClaimRepo CR = new ClaimRepo();
            return CR.Getclaim();

        }
    }
}