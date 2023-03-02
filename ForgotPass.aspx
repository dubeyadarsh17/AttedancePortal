<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="AttedancePortal.forgetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <!-- Including Bootstrap JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js">
	</script>
    <script type="text/javascript">
        setTimeout(function () {
            $("#close").hide();
        }, 3000);

        setTimeout(function () {
            $("#close2").hide();
        }, 3000);

        $(document).ready(function () {
            $('#show_password').hover(function show() {
                //Change the attribute to text
                $('#newpass').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    //Change the attribute back to password
                    $('#newpass').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });
        });

        $(document).ready(function () {
            $('#show_password1').hover(function show() {
                //Change the attribute to text
                $('#confirmpass').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    //Change the attribute back to password
                    $('#confirmpass').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        
<%--<div class="form-gap"></div>
<div class="container">
	<div class="row">
        <div id="alert" style="margin-top:50px;width: 355px;margin-left: 410px;">
           <div class="alert alert-success d-flex align-items-center" role="alert">
           </div>
             <div id="close" class="alert alert-danger d-flex align-items-center " role="alert">
             </div>
            <div id="close2" class="alert alert-warning" role="alert">
            </div>
        </div>
		<div class="col-md-4 col-md-offset-4 my-5" >
            <div class="panel panel-default ">
              <div class="panel-body">
              
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">Forgot Password?</h2>
                  <p>You can reset your password here.</p>
                  <div class="panel-body">
    
                    <div id="register-form" role="form" autocomplete="off" class="form" method="post">
    
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="email" runat="server" name="email" placeholder="email address" class="form-control"  type="email" />
                        </div>
                      </div>
                      <div class="form-group">
                          <asp:Button ID="resetbtn" runat="server" Text="Reset Password" class="btn btn-lg  btn-block" style="background-color: #EC5F20;" OnClick="resetbtn_Click" />
                      </div> 
                      <input type="hidden" class="hide" name="token" id="token" value=""/> 
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>--%>

        <div class="form-gap"></div>
     <div class="container">
    <div class="row">
        <div class="my-2 justify-content-center" style="margin-top:50px; width:370px; margin-left:400px">
            <div class="alert alert-success"  id="close2" role="alert"></div>
            <div class="alert alert-danger" id="close"  role="alert"></div>
        </div>
        <div class="col-md-4 col-md-offset-4 my-5"  >
            <div class="panel panel-default " style=" box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);">
              <div class="panel-body">
                <div class="text-center">
                     <h3 class="text-center">Forgot Password?</h3>
                  <h3><i class="fa fa-lock fa-4x"></i></h3>

                  <p class="text-center text-secondary">Enter your Email Id .</p>
                    <p class="text-center text-secondary">Your new password should be different from your other old passwords</p>
                  <div class="panel-body">

                    <div id="register-form" role="form" autocomplete="off" class="form" method="post">

                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="email" runat="server" name="email" placeholder="email address" class="form-control "  type="email" height="40px" />
                        </div>

                      </div>

                        <div class="form-group " style="position: relative;">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                          <input id="newpass" runat="server" name="newpass" placeholder="New Password" class="form-control "  type="password" height="40px" />
                             <i class="fa fa-eye-slash icon" id="show_password" style="margin-left: -25px; cursor: pointer; margin-top: 16px; display: inline-block; position: absolute; right: 10px; top: -5px; z-index:100"></i>
                        </div>
                      </div>

                        <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                          <input id="confirmpass" runat="server" name="email" placeholder="Confirm Password" class="form-control "  type="password" height="40px" />

                             <i class="fa fa-eye-slash icon" id="show_password1" style="margin-left: -25px; cursor: pointer; margin-top: 16px; display: inline-block; position: absolute; right: 10px; top: -5px; z-index:100"></i>
                        </div>
                      </div>

                         <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newpass" ControlToValidate="confirmpass" ErrorMessage="Password does not match" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>


                      <div class=" col-md-12 d-flex mt-5">
                          <asp:Button ID="Submit" runat="server" Text="Submit" class="btn btn-md btn-primary me-5 col-md-6" Style="width:100px; margin-right:10px;"  OnClick="Submit_Click"  />
                          <asp:Button ID="Back" runat="server" Text="Back" class="btn btn-md  btn-warning col-md- " Style="width:100px" OnClick="Back_Click" />

                      </div >

                        <div class="mt-5">
                             <asp:Label runat="server" ID="lblmsg" ForeColor="green"></asp:Label>
                        </div>

                      <input type="hidden" class="hide" name="token" id="token" value=""/>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
    </div>
</div>


    </form>
</body>
</html>
