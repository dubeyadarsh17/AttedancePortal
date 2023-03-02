<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm12.aspx.cs" Inherits="AttedancePortal.WebForm12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Mobiscroll JS and CSS Includes -->
    <link rel="stylesheet" href="css/mobiscroll.javascript.min.css"/>
    <script src="js/mobiscroll.javascript.min.js"></script>

     <script>
         // Ignore this in your implementation
         window.isMbscDemo = true;
     </script>

	<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js" integrity="sha512-RCgrAvvoLpP7KVgTkTctrUdv7C6t7Un3p1iaoPr1++3pybCyCsCZZN7QEHMZTcJTmcJ7jzexTO+eFpHk4OCFAg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"/>--%>

      <script type="text/javascript">

          //$(document).ready(function () {
          //    $('#Calendar1 td').click(function () {
          //        $('#myModal').show();
          //    });

          //    $('#startdate, #enddate').datepicker();

          //    $('.close').click(function () {
          //        $('#myModal').hide();
          //    });

          //    debugger

          //    $('#addevent').click(function () {
          //        var startdate = $('#startdate').val();
          //        var enddate = $('#enddate').val();
          //        $.ajax({
          //            type: 'POST',
          //            url: 'WebForm1.aspx/AddEvent',
          //            data: '{startdate: "' + startdate + '", enddate: "' + enddate + '"}',
          //            contentType: 'application/json; charset=utf-8',
          //            dataType: 'json',
          //            success: function () {
          //                alert('Event added!');
          //            },
          //            error: function () {
          //                alert('Error adding event!');
          //            }
          //        });
          //    });
          //});
          debugger
          mobiscroll.calendar('#calendar', {
              display: 'inline',
              controls: ['calendar', 'time'],
              touchUi: false,
              select: 'multiple',
              events: []
          });

          var calendar = mobiscroll.calendar('#calendar', {
              // calendar options
          });

          calendar.onAddEvent(function (event) {
              // get the start and end dates for the event
              var start = event.start.toISOString();
              var end = event.end.toISOString();

              // send an AJAX request to add the event
              $.ajax({
                  type: "POST",
                  url: "WebForm12.aspx/AddEvent",
                  data: JSON.stringify({ start: start, end: end }),
                  contentType: "application/json; charset=utf-8",
                  dataType: "json",
                  success: function (response) {
                      // handle successful add event
                  },
                  error: function (response) {
                      // handle error
                  }
              });
          });

          calendar.onEditEvent(function (event) {
              // handle edit event
          });

          calendar.onDeleteEvent(function (event) {
              // handle delete event
          });




      </script>
  

</head>
<body>
    <form id="form1" runat="server">
       <%-- <asp:Calendar ID="Calendar1" runat="server"  Width="50%" Height="50%"/>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>Select date range:</p>
                <input type="text" id="startdate" />
                <input type="text" id="enddate" />
                <button id="addevent">Add Event</button>
            </div>
        </div>--%>


        <div id="calendar"></div>

    </form>
</body>
</html>
