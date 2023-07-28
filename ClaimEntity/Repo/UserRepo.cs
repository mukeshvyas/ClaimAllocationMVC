using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClaimEntity.Repo
{
    public class UserRepo
    {
        public List<User> Getuser()
        {
            AlgoZyEntities DBContext = new AlgoZyEntities();
            var lstuser = DBContext.Users.ToList();
            return lstuser;
        }

    }
}
