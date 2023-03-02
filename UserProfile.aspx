<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="AttedancePortal.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fasicon{
    font-size: 40px;
    color: forestgreen;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row  p-3 my-5">
            <div class="col-md-4 col-sm-12">
                <div class="mb-3">
                    <asp:Image ID="empimg" runat="server" class="rounded-circle mb-3 d-block"
                        style="width: 150px; height:150px" alt="Avatar" ImageUrl='<%#Eval("emp_profileimg") %>' />  
                    <label for="FileUpload1" class="form-label">Change profile picture</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                       <%-- <input class="form-control" type="file" id="formFile" runat="server">--%>
                    <h5 class="mb-2"><strong> <asp:Label ID="empnamelbl" runat="server" Text=""></asp:Label></strong></h5>
                    <p class="text-muted"> <asp:Label ID="empdesiglbl" runat="server" Text="" class="form-label "></asp:Label> <span class="badge bg-primary">PRO</span></p>
                </div>
            </div>
            <div class="col-md-8 col-sm-12">
                <div class="row g-3" >
                   <%-- id--%>
                    <div class="d-flex">
                    <div class="col-md-6 me-3">
                        <asp:Label ID="idlbl" runat="server" Text="Employee ID" class="form-label "></asp:Label>
                        <asp:TextBox ID="idtxt" runat="server" class="form-control mt-2 " ReadOnly="true" ></asp:TextBox>

                    </div>
                  <%--  name--%>
                    <div class="col-md-6">
                        <asp:Label ID="namelbl" runat="server" Text="Employee Name" class="form-label "></asp:Label>
                        <asp:TextBox ID="nametxt" runat="server" class="form-control mt-2" ></asp:TextBox>

                    </div>
                    </div>
                     <div class="d-flex">
                     <%--  email--%>
                     <div class="col-md-6 me-3">
                        <asp:Label ID="emailbl" runat="server" Text="Email" class="form-label "></asp:Label>
                        <asp:TextBox ID="emailtxt" runat="server" class="form-control mt-2" ReadOnly="true"></asp:TextBox>

                    </div>
                     <%--  contact--%>
                    <div class="col-md-6">
                        <asp:Label ID="contactlbl" runat="server" Text="Contact" class="form-label "></asp:Label>
                        <asp:TextBox ID="contacttxt" runat="server" class="form-control mt-2" ></asp:TextBox>

                    </div>
                    </div>
                     <%--  department--%>
                     <div class="d-flex">
                     <div class="col-md-6 me-3">
                        <asp:Label ID="deptlbl" runat="server" Text="Department" class="form-label "></asp:Label>
                         <asp:DropDownList ID="department" runat="server" class="form-select mt-2" ></asp:DropDownList>

                    </div>
                     <%--  designation--%>
                    <div class="col-md-6 ">
                        <asp:Label ID="desiglbl" runat="server" Text="Designation" class="form-label "></asp:Label>
                        <asp:TextBox ID="desigtxt" runat="server" class="form-control mt-2" ReadOnly="true" ></asp:TextBox>

                    </div>
                    </div>
                     <%--  vleaves--%>
                    
                     <div class="col-md-12 ">
                        <asp:Label ID="addresslbl" runat="server" Text="Address" class="form-label "></asp:Label>
                        <asp:TextBox ID="addresstxt" runat="server" class="form-control mt-2" ></asp:TextBox>

                    </div>
                    
                 <%--  button--%>
                    <div class="col-md-6 align-items-center justify-content-around d-flex mt-5">
                        <asp:Button ID="Upadte" runat="server" Text="Update" OnClick="Upadte_Click" class="btn btn-primary mx-5"  />
                      <a href="Home.aspx" type="button" class="ms-5"><i class=" fasicon fa-regular fa-circle-left"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</asp:Content>
