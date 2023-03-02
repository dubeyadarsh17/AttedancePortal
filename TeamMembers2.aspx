<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="TeamMembers2.aspx.cs" Inherits="AttedancePortal.TeamMembers2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
        fas{
             font-size: 14px;
             color: #85929E;
       }

       .details{
           font-size: 14px;
       }

   </style>
    <link href="CSS/TeamMember.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"  >
    <div class="mt-2" style="width:230px; margin-left:80px">
                  <%-- <strong class="small text-muted" >Select Department</strong>--%>
                   <asp:DropDownList ID="deptdropdown" runat="server" CssClass="dropdown-toggle form-input"   data-bs-toggle="dropdown"  AutoPostBack="true" OnSelectedIndexChanged="deptdropdown_SelectedIndexChanged" >

                   </asp:DropDownList>
               </div>
    <div  style="margin-left:65px" >
        <asp:DataList ID="Empcards" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CssClass="col-md-12" OnItemCommand="Empcards_ItemCommand"  >
            <ItemTemplate>
                <div class="col-lg-12 col-md-12 col-sm-12 " >
                    <div class="card my-3 mx-2 " >
                        <div class="card-body" >
                             <div class="d-flex flex-column details">
                            <div class="my-2 align-items-center  d-flex ">
                                 <asp:Image ID="profileimg" runat="server" Width="50" Height="50" class="rounded-circle" ImageUrl='<%# Eval("emp_profileimg") %>' />
                               <div class="ms-5 d-flex flex-column">
                                    <asp:Label ID="name" runat="server" CssClass="text-primary"  Text='<%# Eval("emp_name") %>'></asp:Label>
                                    <asp:Label ID="desig" runat="server" CssClass="text-muted"  Text='<%# Eval("emp_designation") %>'></asp:Label>
                               </div>
                                 <asp:LinkButton ID="Edit" runat="server" CommandName="edit" ><i class="fa-solid fa-pen-to-square ms-5" style="font-size:20px "></i></asp:LinkButton>
                            </div>

                            <div style="background-color:#f5f9f9;" class="my-1 align-items-center text-center p-2" >

                                <div class="d-flex" >
                                    <i class="fas fa-solid fa-id-badge me-1 mt-1"></i>
                                    <asp:Label ID="empidlbl" runat="server" CssClass="text-muted ms-3" Text='<%# Eval("emp_id") %>'></asp:Label>
                                </div>

                                 

                                <div class=" d-flex">
                                  <i class="fas fa-solid fa-phone me-1 mt-1" ></i>
                                  <asp:Label ID="contactlbl" runat="server" CssClass="text-muted ms-3" Text='<%# Eval("emp_contact") %>'></asp:Label>
                                </div>

                                <div class="d-flex">
                                  <i class=" fas fa-solid fa-envelope me-1 mt-1" ></i>
                                  <asp:Label ID="emailbl" runat="server" CssClass="text-muted ms-3" Text='<%# Eval("emp_email") %>'></asp:Label>
                               </div>

                                <%--<div class=" d-flex">
                                   <i class="fas fa-solid fa-user me-1 mt-1"  ></i><asp:Label ID="genderlbl" runat="server" CssClass="text-muted ms-3" Text= '<%# Eval("emp_gender") %>'></asp:Label>
                                        </div>--%>

                                <%-- <div class="d-flex">
                                    <i class="fas fa-solid fa-building me-1 mt-1" ></i>
                                    <asp:Label ID="deptlbl" runat="server" CssClass="text-muted ms-3" Text='<%# Eval("department") %>'></asp:Label>
                               </div>--%>

                                <%-- <div class=" d-flex">
                                  <i class="fas fa-solid fa-globe me-1 mt-1" ></i>
                                  <asp:Label ID="companylbl" runat="server" CssClass="text-muted ms-3"  Text='<%# Eval("emp_worklocation") %>'></asp:Label>
                             </div>--%>

                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            
        </asp:DataList>
    </div>
</asp:Content>
