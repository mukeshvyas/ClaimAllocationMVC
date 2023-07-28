using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ClaimAllocationMVC.Startup))]
namespace ClaimAllocationMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
