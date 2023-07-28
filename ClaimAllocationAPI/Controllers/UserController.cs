using ClaimEntity;
using ClaimEntity.Repo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace ClaimAllocationAPI.Controllers
{
    public class UserController : ApiController
    {
        // GET api/<controller>
        public List<User> Get()
        {
            
            UserRepo UR = new UserRepo();
            var lstuser = UR.Getuser();
            return lstuser;
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        
    }
}