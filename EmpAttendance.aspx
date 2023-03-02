<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="EmpAttendance.aspx.cs" Inherits="AttedancePortal.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <script src="//cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#emptable').DataTable({ "lengthChange": false });

        });

        
    </script>
    <link href="CSS/TeamMember.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
         <div class="mt-5 d-flex">
       <div class="me-2 d-flex flex-column " style="width:225px;">
           <asp:Label runat="server" ID="fromdatelbl" Text="From Date"></asp:Label>
           <asp:TextBox ID="fromdate" runat="server" TextMode="Date" CssClass="form-control  " required="" ValidationGroup="abc" ></asp:TextBox>
       </div>
        <div class="me-2 d-flex flex-column " style="width:225px;">
            <asp:Label ID="todatelbl" runat="server" Text="To Date"></asp:Label>
           <asp:TextBox ID="todate" runat="server" TextMode="Date"  CssClass="form-control " required="" ValidationGroup="abc" ></asp:TextBox>
       </div>
        <div>
            <asp:Button ID="datefilter" runat="server" class="btn btn-primary mt-4 me-5 " ValidationGroup="abc" OnClick="datefilter_Click" Text="Show"/>
        </div>
         <div class="d-flex ms-5 flex-column mt-4 ">
                  <%-- <strong class="small text-muted me-3 mt-1 " >Select Department</strong>--%>
                   <asp:DropDownList ID="deptdropdown" runat="server" CssClass="dropdown-toggle form-input  "  data-bs-toggle="dropdown"  >
                   <asp:ListItem>Select Department</asp:ListItem>
                   </asp:DropDownList>
         </div>
         <div class="ms-5 excel"  >
            <asp:Button ID="download" runat="server" class="btn btn-warning mt-4 " Text="Download" OnClick="download_Click" />
        </div>
    </div>    </div>
    <div class="container1 ">
        <div class=" d-flex justify-content-center align-items-center h-100" style="margin-right: 20px;">
            <div class="col col-xl-12">
                <section class="attendance  mb-5">
                    <div class="attendance-list">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <HeaderTemplate>
                                <table id="emptable" class="table ">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Designation</th>
                                            <th>Time In</th>
                                            <th>Status</th>
                                            <th>Time Out</th>
                                            <th>Work Hours</th>
                                        </tr>
                                    </thead>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="date" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="empid" runat="server" Text='<%# Eval("emp_id") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="empname" runat="server" Text='<%# Eval("emp_name") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="emp_desig" runat="server" Text='<%# Eval("emp_designation") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="timein" runat="server" Text='<%# Eval("Time_In") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="status" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="timeout" runat="server" Text='<%# Eval("Time_Out") %>'></asp:Label>
                                    <td>
                                        <asp:Label ID="workhours" runat="server" Text='<%# Eval("Work_Hours") %>'></asp:Label>
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
