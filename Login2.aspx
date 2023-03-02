<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="AttedancePortal.Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/login2.css" rel="stylesheet" />
    <!-- bootstap cdn-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div class="wrapper">
        <div class="logo">
            <img src="images/mob.jpg" alt="">
        </div>
        <div class="text-center mt-4 name">
           Login
        </div>
        <div class="p-3 mt-2">
            <div class="form-field d-flex align-items-center">
                <span class="far fa-user"></span>
                <input type="text" runat="server" name="userName" id="userName" placeholder="Username" />
            </div>
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span>
                <input type="password" runat="server" name="password" id="pwd" placeholder="Password" typeof="password" />
            </div>
            <asp:Button ID="Button1" class="btn mt-3" runat="server" Text="Login" />
        </div>
        <div class="text-center fs-6">
            <a href="#">Forget password?</a>
        </div>
    </div>
    </form>
</body>
</html>
