<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm14.aspx.cs" Inherits="AttedancePortal.WebForm14" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/fullcalendar.min.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/fullcalendar.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>



</head>
<body>
    <form id="form1" runat="server">
        <div id="calendar"></div>

        <!-- Modal popup for adding an event -->
        <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="eventModalLabel">Add Event</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" >
                        <div>
                            <div class="form-group">
                                <label for="title">Title</label>
                                <input type="text" name="title" class="form-control" id="title" placeholder="Event Title" />
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea class="form-control"  id="description" rows="3" placeholder="Event Description"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="startDate">Start Date</label>
                                <input type="text" class="form-control"  id="startDate" />
                            </div>
                            <div class="form-group">
                                <label for="endDate">End Date</label>
                                <input type="text" class="form-control"  id="endDate" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <asp:Button class="btn btn-primary" ID="saveButton" runat="server" Text="Submit"  />
                      <%--  <button type="button" class="btn btn-primary" id="saveButton" onclick="">Save Event</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
    
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <%--BootStrap cdn--%>

    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"/>--%>

    <%--JAvaScript cdn--%>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $('#calendar').fullCalendar({
                // Configuration options for FullCalendar
                selectable: true,             
                select: function () {
                    $('#eventModal').modal('show');


                    //$('#startDate').val(moment(start).format('DD-MM-YYYY'));
                    //$('#endDate').val(moment(end).format('DD-MM-YYYY'));

                    //$('#saveButton').unbind('click').click(function () {
                    //    var startdate = $('#startDate').val();
                    //    /* var enddate = $('#endDate').val();*/
                    //    var title = $('#title').val();
                    //    var description = $('#description').val();

                    //    if (title) {
                    //        var eventData = {

                    //            startdate: startdate,
                    //            title: title,
                    //            description: description
                    //        };


                    //        $.ajax({


                    //            type: 'POST',
                    //            url: 'WebForm14.aspx.cs/AddEvent',
                    //            data: eventData,
                    //            contentType: 'application/json; charset=utf-8',
                    //            dataType: 'json',
                    //            success: function () {
                    //                alert('Event added!');
                    //            },
                    //            error: function () {
                    //                alert('Error adding event!');
                    //            }
                    //        });
                    //    }
                    //});



                    $('#saveButton').click(function () {
                        let user = {};
                        user.start = $('#startDate').val();
                        user.end = $('#endDate').val();
                        user.title = $('#title').val();
                        user.description = $('#description').val();
                        
                        $.ajax({
                            type: "Post",
                            url: "WebForm14.aspx/addNewUser",
                            data: '{objuserDetails: ' + JSON.stringify(user) + '}',
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: OnSuccess,
                            error: OnErrorCall
                        });

                        function OnSuccess(response) {
                            var result = response.d;
                            if (result == 'success') {
                                $('#msg').html('New record addded successfully  :)').css("color", "green");
                            }
                            $('#txtFirstName').val('');
                            $('#txtLastName').val('');
                            $('#txtLocation').val('');
                        }

                        function OnErrorCall(response) {
                            $('#msg').html('Error occurs  :(').css("color", "red");
                        }

                    });

                    $('.close').click(function () {
                        $('#eventModal').modal('hide');
                        $('#eventModal').show();
                    });

                }
            });
        });



        //$(document).ready(function () {

        //    $("#saveButton").on('click', function (e) {

        //        e.preventDefault();
        //        var userDetails = {};

        //        userDetails.start = $("#startDate").val();
        //        userDetails.title = $("#title").val();
        //        userDetails.description = $("#description").val(); 

        //        var jsonData = JSON.stringify({
        //            userDetails: userDetails
        //        });

        //        $.ajax({
        //            type: "POST",
        //            url: "Ajax_function/WebForm14.asmx/addNewUser",
        //            data: jsonData,
        //            contentType: "application/json; charset=utf-8",
        //            dataType: "json",
        //            success: OnSuccess,
        //            error: OnErrorCall
        //        });

        //        function OnSuccess(response) {
        //            var result = response.d;
        //            if (result == "success") {
        //                $("#msg").html("New record addded successfully  :)").css("color", "green");
        //            }
        //            $("#txtFirstName").val("");
        //            $("#txtLastName").val("");
        //            $("#txtLocation").val("");
        //        }

        //        function OnErrorCall(response) {
        //            $("#msg").html("Error occurs  :(").css("color", "red");
        //        }

        //    });

        //    $('.close').click(function () {
        //        $('#eventModal').modal('hide');
        //        $('#eventModal').show();
        //    });

        //});




    </script>
</body>
</html>
