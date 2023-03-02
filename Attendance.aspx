<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="AttedancePortal.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Attendance.css" rel="stylesheet" />
   <%-- <link href="CSS/TeamMember.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=""  style="margin-left:90px; margin-right:20px;">
       <div class="d-flex col-md-12">

         <%--  card--%>
           <div class="card my-2 col-md-4 p-2 me-3 " style="background:#fafafa">
               <div class="d-flex flex-column align-items-center">
                    <asp:Image ID="empimg" runat="server" class="rounded-circle mb-3 d-block"
                        style="width: 100px; height:100px" alt="Avatar" ImageUrl='<%#Eval("emp_profileimg") %>' />
                    <h5 class="mb-2"><strong> <asp:Label ID="empnamelbl" runat="server" Text=""></asp:Label></strong></h5>
                    <p class="text-active"> <asp:Label ID="empdesiglbl" runat="server" Text=""></asp:Label> </p>
                   <div class=" p-3 d-flex rounded-2 text-dark" style="background:#AED6F1 ;font-size:14px;" >
                       <asp:Label ID="msgboxlbl" runat="server" style="color:#5E11BA;"></asp:Label>

                  </div>
                   <div class="d-flex flex-column my-3">
                        <asp:Button ID="TimeIn" runat="server" Text="Time In" class="btns cbtn mb-2 " Visible="false" OnClick="TimeIn_Click"/>
                        <asp:Button ID="Timeout" runat="server" Text="Time Out" class="btns cbtn " Visible="false" OnClick="Timeout_Click"/>
                   </div>

               </div>
           </div>


    <%-- repeater--%>
           <div class="card p-2 my-2 col-md-8 " style="background:#fafafa">
           <div class="d-flex  my-4">
                <div class="me-2 d-flex flex-column "  style="width:225px;">
           <asp:Label ID="fromdatelbl" runat="server" Text="From Date" ></asp:Label>
           <asp:TextBox ID="fromdate" runat="server" TextMode="Date" CssClass="form-control" ValidationGroup="validate"></asp:TextBox>
       </div>
        <div class="me-2 d-flex flex-column " style="width:225px;">
            <asp:Label ID="todatelbl" runat="server" Text="To Date" ></asp:Label>
           <asp:TextBox ID="todate" runat="server" TextMode="Date" CssClass="form-control"   ValidationGroup="validate"></asp:TextBox>
       </div>
        <div>
            <asp:Button ID="datefilter" runat="server" class="btn btn-primary mt-4 " Text="Show" OnClick="datefilter_Click" ValidationGroup="validate"/>
        </div>

    </div>
               <div class="my-2">
                        <asp:Repeater ID="User_attendance" runat="server" OnItemDataBound="User_attendance_ItemDataBound" >
                            <HeaderTemplate >
                                <table id="emptable" class="border table" >
                                    <thead>
                                        <tr style="background-color:#6082B6; color:#FFF; ">
                                            <th> Date</th>
                                            <th>Time In</th>

                                            <th>Time Out</th>
                                               <th>Status</th>
                                            <th>Work Hours</th>

                                        </tr>
                                    </thead>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                     <td>
                                        <asp:Label ID="date" runat="server" Text='<%# Eval("Date") %>' ></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="timein" runat="server"  Text='<%# Eval("Time_In") %>'></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="timeout" runat="server"  Text='<%# Eval("Time_Out") %>'></asp:Label>
                                    </td>
                                    <td>
                                          <asp:Label ID="status" runat="server"  Text='<%# Eval("Status") %>' class="rounded px-1" >
                                          </asp:Label>

                                    </td>
                                     <td>
                                        <asp:Label ID="workhours" runat="server"  Text='<%# Eval("Work_Hours") %>'></asp:Label>
                                    </td>

                                </tr>

                            </ItemTemplate>
                            <FooterTemplate>
                                 </table>
                            </FooterTemplate>
                        </asp:Repeater>
                   </div>
           </div>
       </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</asp:Content>
