<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="EmpAssets.aspx.cs" Inherits="AttedancePortal.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>
     <script src="//cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#emptable').DataTable();
                
            });
        </script>
    <link href="CSS/TeamMember.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1 ">
        <div class=" d-flex justify-content-center align-items-center h-100" style="margin-right: 20px;">
            <div class="col col-xl-12">
               <div style="width:194px;">
                   <strong class="small text-muted" >Select Department</strong>
                   <asp:DropDownList ID="deptdropdown" runat="server" CssClass="dropdown-toggle form-input"  data-bs-toggle="dropdown" OnSelectedIndexChanged="deptdropdown_SelectedIndexChanged" AutoPostBack="true">

                   </asp:DropDownList>
               </div>

                <section class="attendance  mb-5">
                    <div class="attendance-list">
                        <asp:Repeater ID="Repeater1" runat="server"   >
                            <HeaderTemplate >
                                <table id="emptable" class="table mt-5">
                                    <thead>
                                        <tr>
                                            <th>Employee ID</th>
                                            <th>Employee Name</th>
                                            <th>Designation</th>
                                            <th>System Info</th>
                                            <th>Workplace</th>                                                                    
                                        </tr>
                                    </thead>
                               
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="empid" runat="server"   Text='<%# Eval("emp_id") %>'></asp:Label>
                                    </td>
                                    <td>  
                                        <asp:Label ID="empname" runat="server"  Text='<%# Eval("emp_name") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="emptitle" runat="server"  Text='<%# Eval("emp_designation") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="empsystem" runat="server"  Text='<%# Eval("emp_system") %>'></asp:Label>
                                        <asp:TextBox ID="systemtxt" runat="server" Text='<%# Eval("emp_system") %>' Visible="false" BackColor="#F2F2F2" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="emplocation" runat="server"  Text='<%# Eval("emp_worklocation") %>'></asp:Label>
                                        <asp:TextBox ID="locationtxt" runat="server" Text='<%# Eval("emp_worklocation") %>' Visible="false" BackColor="#F2F2F2" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>

                            </ItemTemplate>
                            <FooterTemplate>
                                 </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
