<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login4.aspx.cs" Inherits="AttedancePortal.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />

    <link href="CSS/loginex.css" rel="stylesheet" />

    <%--jquery--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">  
        $(document).ready(function () {
            $('#show_password').hover(function show() {
                //Change the attribute to text  
                $('#pass').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    //Change the attribute back to password  
                    $('#pass').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });
        });
    </script>
    <link href="CSS/login.css" rel="stylesheet" />
</head>
<body>
   <center>
            <form id="form1" runat="server">
               <%-- <div class="form-bg col-md-4">--%>
                    <div class="container mt-5 col-md-12">
                       <%-- <div class="card ">--%>
                             <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6">
                            <div class="form-container">
                                <%-- <h3 class="title">My Account</h3>--%>
                                <img src="images/m-logo.png" class="title" />
                                <div class="form-horizontal">
                                    <div class="form-icon">
                                        <i class="fa fa-user-circle"></i>
                                    </div>
                                    <div class="form-group mb-3">
                                        <span class="input-icon"><i class="fa fa-user"></i></span>
                                        <input runat="server" type="email" id="email" class="form-control" placeholder="Username" required="" />
                                    </div>
                                    <div class="form-group" style="position: relative;">
                                        <span class="input-icon"><i class="fa fa-lock"></i></span>
                                        <input runat="server" type="password" id="pass" class="form-control" placeholder="Password" required="" />
                                        <i class="fa fa-eye-slash icon" id="show_password" style="margin-left: -25px; cursor: pointer; margin-top: 16px; display: inline-block; position: absolute; right: 10px; top: 0;"></i>

                                    </div>
                                    <span class="forgot mb-5"><a href="forgetpassword.aspx">Forgot Password?</a></span>
                                    <%-- <button class="btn signin">Login</button>--%>
                                    <asp:Button ID="Loginbtn" runat="server" class="btn signin" Text="Login" OnClick="Loginbtn_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                <%--</div>--%>

            </form>
       </center>
</body>
</html>
