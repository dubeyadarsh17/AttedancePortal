<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="UserProfileCard.aspx.cs" Inherits="AttedancePortal.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
       .back1{
           background:#6082B6;  /*linear-gradient(to right, blue, #24C8C6);*/
       }
       .back2{
           background: #f5f9f9;
       }
       .fasicon {
             font-size: 25px;
             color: forestgreen;
       }
      .change{
          display: flex;
          justify-content:center;
          align-items: center;
      }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section class="change"  >
       <div class=" col-md-3 col-sm-12">
        <div class="card my-5"  style="border-top-left-radius: 20px; border-top-right-radius: 20px">
           <%-- <div class="card-body">--%>
               <div class="d-flex flex-column ">
                   <div class="d-flex back1 p-3" style="border-top-left-radius: 20px; border-top-right-radius: 20px">
                       <asp:Image ID="profileimg" runat="server" width="80" height="80" class="rounded-circle" />
                       <div class="d-flex flex-column mx-5 mt-2">
                          <asp:Label ID="name" runat="server" CssClass="text-light" ></asp:Label>
                         <asp:Label ID="desig" runat="server"  CssClass="text-muted"></asp:Label>

                       </div>
                   </div>
                   <div class="p-3 ">
                   <div class="mt-2">
                       <div class="d-flex">
                           <h6 class="text-muted">Employee Details</h6>
                           <asp:LinkButton ID="Edit" runat="server" OnClick="Edit_Click" ><i class="fa-solid fa-pen-to-square ms-5" style="font-size:20px "></i>
                           </asp:LinkButton>
                       </div>

                       <hr class="mb-2 mt-1 me-5"/>
                   </div>
                   <div>
                       <div class= " mb-2 col-8 col-sm-12" >
                           <div class="d-flex">
                              <i class="fa-solid fa-id-badge me-1 mt-1" style="font-size:18px; color:grey "></i>
                                <asp:Label ID="empid" runat="server" Text="Employee ID:"></asp:Label>
                                <asp:Label ID="empidlbl" runat="server" CssClass="text-muted ms-3"></asp:Label>
                           </div>

                       </div>
                        <div class= " col-8 col-sm-12" >
                           <div class=" mb-2 d-flex">
                               <i class="fa-solid fa-user me-1 mt-1" style="font-size:18px; color:grey "></i>
                                <asp:Label ID="gender" runat="server" Text="Gender:"></asp:Label>
                                <asp:Label ID="genderlbl" runat="server"  CssClass="text-muted ms-3"></asp:Label>
                           </div>

                       </div>



                       <div class= " mb-2 col-8 col-sm-12" >
                          <div class="d-flex">
                              <i class="fa-solid fa-envelope me-1 mt-1" style="font-size:18px; color:grey "></i>
                                <asp:Label ID="email" runat="server" Text="Email:"></asp:Label>
                               <asp:Label ID="emailbl" runat="server"  CssClass="text-muted ms-3"></asp:Label>
                           </div>

                       </div>
                        <div class= " col-8 col-sm-12" >
                          <div class=" mb-2 d-flex">
                              <i class="fa-solid fa-phone me-1 mt-1" style="font-size:18px; color:grey "></i>
                                <asp:Label ID="contact" runat="server" Text="Contact:"></asp:Label>
                               <asp:Label ID="contactlbl" runat="server" CssClass="text-muted ms-3"></asp:Label>
                           </div>

                       </div>

                       <div class= " col-8 col-sm-12" >
                          <div class=" mb-2 d-flex">
                             <%-- <i class="fa-solid fa-phone me-1 mt-1" style="font-size:18px; color:grey "></i>--%>
                              <i class="fa-sharp fa-solid fa-location-dot me-1 mt-1" style="font-size:18px; color:grey "></i>
                                <asp:Label ID="address" runat="server" Text="Place:"></asp:Label>
                               <asp:Label ID="place" runat="server" CssClass="text-muted ms-3"></asp:Label>
                           </div>

                       </div>



                       <div class= " col-8 col-sm-12" >
                           <div class="mb-2 d-flex">
                             <i class="fa-solid fa-building me-1 mt-1" style="font-size:18px; color:grey "></i>
                                <asp:Label ID="dept" runat="server" Text="Department:"></asp:Label>
                                <asp:Label ID="deptlbl" runat="server"  CssClass="text-muted ms-3"></asp:Label>
                           </div>

                       </div>
                        <div class= "col-8 col-sm-12" >
                          <div class="mb-2 d-flex">
                              <i class="fa-solid fa-globe me-1 mt-1" style="font-size:18px; color:grey "></i>
                                <asp:Label ID="company" runat="server" Text="Company:"></asp:Label>
                               <asp:Label ID="companylbl" runat="server" CssClass="text-muted ms-3"></asp:Label>
                           </div>

                       </div>

                       <div class="d-flex justify-content-end">
                            <a href="TeamMembers2.aspx" type="button" class="ms-5"><i class=" fasicon fa-regular fa-circle-left"></i></a>
                       </div>

                       </div>
                       </div>
               </div>
            </div>
        </div>
     <%-- </div>--%>
    </section>
</asp:Content>
