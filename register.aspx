<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="AttedancePortal.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/register.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
    <div class="signup-form" action="/register" method="post">
        <%-- <div class="card">--%>
        <div class="form-header">
            <h1>Create Account</h1>
        </div>
        <!-- form body -->
        <div class="form-body" id="registeradd">
            <!-- Empid and gender -->
            <div class="horizontal-group d-flex mt-3">
                <div class="form-group left ">
                    <label for="empid" class="label-title">Emp Id *</label>
                    <asp:TextBox ID="empid" runat="server" class="form-input" placeholder="Enter Employee Id" TabIndex="1" ValidationGroup="abc" ></asp:TextBox>
                    <%--<input type="text" runat="server" id="empid" class="form-input" placeholder="Enter Employee Id"  tabindex="1" validationgroup="abc" onchange=""/>--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter valid Employee Id" ControlToValidate="empid" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RequiredFieldValidator>
                </div>
               
                <div class="form-group right ms-3 ">
                    <label for="gender" class="label-title">Gender *</label>
                    <div class="d-flex ">
                        <asp:RadioButtonList ID="gender" class="d-flex from-check-input" runat="server" RepeatDirection="Horizontal" ValidationGroup="abc">
                            <asp:ListItem class="me-3 d-flex">Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Gender" ControlToValidate="gender" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- Firstname and Lastname -->
            <div class="horizontal-group ">
                <div class="form-group left">
                    <label for="firstname" class="label-title">First name *</label>
                    <input type="text" runat="server" id="firstname" class="form-input" data-toggle="tooltip" data-placement="top" title="Enter name" placeholder="enter first name" tabindex="2" validationgroup="abc" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Firstname" ControlToValidate="firstname" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group right">
                    <label for="lastname" class="label-title">Last name *</label>
                    <input type="text" runat="server" id="lastname" class="form-input" placeholder="enter  last name" tabindex="3" validationgroup="abc" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Lastname" ControlToValidate="lastname" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- email and contact -->
            <div class="horizontal-group">
                <div class="form-group left">
                    <label for="email" class="label-title">Email *</label>
                    <input type="email" runat="server" id="email" class="form-input" placeholder="enter Email" tabindex="4" validationgroup="abc" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter email" ControlToValidate="email" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid Email Id" ControlToValidate="email" ForeColor="red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="abc"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group right">
                    <label for="contact" class="label-title">Contact *</label>
                    <input type="text" runat="server" id="contact" class="form-input" maxlength="10" placeholder="enter Contact" tabindex="5" validationgroup="abc" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Contact" ControlToValidate="contact" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Contact no." ControlToValidate="contact" ValidationExpression="[0-9]{10}" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RegularExpressionValidator>
                </div>
            </div>
            <!-- country and state -->
            <div class="horizontal-group">
                <div class="form-group left">
                    <label class="label-title">Country *</label>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="country" class="form-input " runat="server" OnSelectedIndexChanged="country_SelectedIndexChanged1" AutoPostBack="true" AppendDataBoundItems="true" ValidationGroup="abc"></asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="country" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="form-group right">
                    <label class="label-title">State *</label>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="state" class="form-input" runat="server" OnSelectedIndexChanged="state_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true" ValidationGroup="abc"></asp:DropDownList>
                        </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="state" />
                        </Triggers>
                    </asp:UpdatePanel>                   
                </div>
            </div>
            <!-- city and pincode -->
            <div class="horizontal-group">
                <div class="form-group left">
                    <label class="label-title">City *</label>

                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="city" class="form-input " runat="server" AutoPostBack="true" AppendDataBoundItems="true" ValidationGroup="abc"></asp:DropDownList>
                        </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="city" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="form-group right">
                    <label for="pincode" class="label-title">Pincode *</label>
                    <input type="text" runat="server" id="pincode" class="form-input" placeholder="enter Pincode" tabindex="6" validationgroup="abc" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Pincode" ControlToValidate="pincode" Display="Dynamic" ForeColor="Red" ValidationGroup="abc"></asp:RequiredFieldValidator>
                </div>
            </div>

            <!-- address  -->
            <div class="form-group">
                <label for="address" class="label-title">Address *</label>
                <input type="text" runat="server" id="address" class="form-input" placeholder="enter Address"  tabindex="7" validationgroup="abc">

                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Address" ControlToValidate="address" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RequiredFieldValidator>
            </div>

            <!-- department and designation -->
            <div class="horizontal-group">
                <div class="form-group left">
                    <label for="dept" class="label-title">Department *</label>
                    <asp:DropDownList ID="dept" runat="server" class="form-input" ValidationGroup="abc">
                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Select Department" ControlToValidate="dept" ForeColor="red" Display="Dynamic" ValidationGroup="abc"></asp:RequiredFieldValidator>
                    <%-- <input type="text" runat="server" id="department" class="form-input" placeholder="enter department" required="required" tabindex="8" />--%>
                </div>
                <div class="form-group right">
                    <label for="designation" class="label-title">Designation *</label>
                    <input type="text" runat="server" id="designation" class="form-input" placeholder="enter designation"  tabindex="9" validationgroup="abc" />

                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter designation" ControlToValidate="designation" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                </div>
            </div>

            <!-- system and workplace -->
            <div class="horizontal-group">
                <div class="form-group left">
                    <label for="system" class="label-title">System </label>
                    <input type="text" runat="server" id="system" class="form-input" placeholder="enter system no. and type"  tabindex="10" validationgroup="abc" />
                </div>
                <div class="form-group right">
                    <label for="workplace" class="label-title">Work Place </label>
                    <input type="text" runat="server" id="workplace" class="form-input" placeholder="enter workplace" tabindex="11"  validationgroup="abc" />
                </div>
            </div>

            <!-- vacation and sick -->
            <div class="horizontal-group">
                <div class="form-group left">
                    <label for="vleaves" class="label-title">Vacation Leaves </label>
                    <input type="text" runat="server" id="vleaves" class="form-input" placeholder="enter no. vacation leaves"  tabindex="12" validationgroup="abc" />
                </div>
                <div class="form-group right">
                    <label for="sleaves" class="label-title">Sick Leaves </label>
                    <input type="text" runat="server" id="sleaves" class="form-input" placeholder="enter no. of sick leaves" tabindex="13"  validationgroup="abc" />
                </div>
            </div>

           <%-- button--%>
            <div class="justify-content-around horizontal-group">
                <asp:Button ID="Button1" class=" btn btn-primary text-light mb-3 px-5 mx-5" runat="server" Text="Submit" OnClick="Button1_Click" ValidationGroup="abc" />
                <asp:Button ID="Resetbtn" class="btn btn-success text-light mb-3 px-5 mx-5" runat="server" Text="Reset" OnClick="Resetbtn_Click" />
            </div>
        </div>
        <%--<asp:Button ID="Updatebtn" class="btn btn-warning text-light" runat="server" Text="Update"  ValidationGroup="abc" />
                        <asp:Button ID="Deletebtn" class="btn btn-danger text-light" runat="server" Text="Delete"  ValidationGroup="abc" />--%>
        <!-- form footer -->
        <div class="form-footer">
        </div>
    </div>
</asp:Content>
