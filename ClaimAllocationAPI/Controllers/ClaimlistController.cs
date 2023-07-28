using ClaimEntity.Repo;
using ClaimModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ClaimAllocationAPI.Controllers
{
    public class ClaimlistController : ApiController
    {
        public List<ClaimlistModel> Getclaimlist()
        {
            ClaimlistRepo CR = new ClaimlistRepo();
            return CR.GetClaimlists();
            
        }
    }
}
