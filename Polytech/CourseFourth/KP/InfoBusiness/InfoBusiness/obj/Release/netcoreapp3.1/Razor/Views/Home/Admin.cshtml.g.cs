#pragma checksum "C:\Users\alexm\source\repos\InfoBusiness\InfoBusiness\Views\Home\Admin.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "b34aec2ef2cbd1c03208ba7bb640ac4916f94cb6"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Admin), @"mvc.1.0.view", @"/Views/Home/Admin.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\alexm\source\repos\InfoBusiness\InfoBusiness\Views\_ViewImports.cshtml"
using InfoBusiness;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\alexm\source\repos\InfoBusiness\InfoBusiness\Views\_ViewImports.cshtml"
using InfoBusiness.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"b34aec2ef2cbd1c03208ba7bb640ac4916f94cb6", @"/Views/Home/Admin.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"8556ff334157aeaf6e0f7944d697150dd326b1b0", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Admin : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<AdminViewModel>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\alexm\source\repos\InfoBusiness\InfoBusiness\Views\Home\Admin.cshtml"
  
    ViewData["Title"] = "Admin";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<br />
<h2 class=""text-muted text-center"" style=""margin-top:0;"">Пользователи</h2>
<br />
<br />
<table class=""table table-bordered table-filter-style"" id=""users-table"" style=""text-align:center"">
    <thead>
        <tr>
            <th>Email</th>
            <th>Роль</th>
        </tr>
    </thead>
    <tbody>
");
#nullable restore
#line 18 "C:\Users\alexm\source\repos\InfoBusiness\InfoBusiness\Views\Home\Admin.cshtml"
         foreach (var userModel in Model.UserWithRole)
        {

#line default
#line hidden
#nullable disable
            WriteLiteral("        <tr>\r\n            <td>");
#nullable restore
#line 21 "C:\Users\alexm\source\repos\InfoBusiness\InfoBusiness\Views\Home\Admin.cshtml"
           Write(userModel.User.UserName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n            <td>");
#nullable restore
#line 22 "C:\Users\alexm\source\repos\InfoBusiness\InfoBusiness\Views\Home\Admin.cshtml"
           Write(userModel.Role);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n        </tr>\r\n");
#nullable restore
#line 24 "C:\Users\alexm\source\repos\InfoBusiness\InfoBusiness\Views\Home\Admin.cshtml"
        }

#line default
#line hidden
#nullable disable
            WriteLiteral("    </tbody>\r\n</table>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<AdminViewModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
