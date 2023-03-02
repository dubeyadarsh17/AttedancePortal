<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm15.aspx.cs" Inherits="AttedancePortal.WebForm15" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
        integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <link rel="Stylesheet" href="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.10/themes/redmond/jquery-ui.css" />
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            SearchText();
        });
        
        function SearchText() {
            debugger
            $(".autosuggest").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "WebForm15.aspx/find",
                        data: "{'a':'" + document.getElementById('txtFirstName').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        }
</script>

</head>
<body>
    <form id="form1" runat="server">

        <table>
            <tr>
                <td>First Name : </td>
                <td>
                    <input id="txtFirstName" type="text" />
                </td>
            </tr>
            <tr>
                <td>Last Name :  </td>
                <td>
                    <input id="txtLastName" type="text" />
                </td>
            </tr>
            <tr>
                <td>Location :  </td>
                <td>
                    <input id="txtLocation" type="text" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button id="auto" class="autosuggest">Add Record</button>
                    <span id="msg"></span>
                </td>
            </tr>
        </table>

    </form>



</body>
</html>
