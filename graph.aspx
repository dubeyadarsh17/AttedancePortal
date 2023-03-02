<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="graph.aspx.cs" Inherits="AttedancePortal.graph" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Pie Chart</title>

    <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-more.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>

    <%--<script type="text/javascript">
        debugger
        window.onload = function () {
            var jan = parseInt(document.getElementById('<%=janhdn1.ClientID%>').value);
            var feb = parseInt(document.getElementById('<%=febhdn.ClientID%>').value);
            var march = document.getElementById('<%=marchhdn.ClientID%>').value;
            var april = document.getElementById('<%=aprilhdn.ClientID%>').value;
            var may = document.getElementById('<%=mayhdn.ClientID%>').value;
            var june = document.getElementById('<%=junehdn.ClientID%>').value;
            var july = document.getElementById('<%=junehdn.ClientID%>').value;
            var augst = document.getElementById('<%=aughdn.ClientID%>').value;
            var sept = document.getElementById('<%=septhdn.ClientID%>').value;
            var oct = document.getElementById('<%=octhdn.ClientID%>').value;
            var nov = document.getElementById('<%=novhdn.ClientID%>').value;
            var desc = document.getElementById('<%=deschdn.ClientID%>').value;
            debugger
            alert(jan);
    var chart = new CanvasJS.Chart("chartContainer", {
        
      title:{
        text: "Fruits sold in First Quarter"              
        },
       

      data: [//array of dataSeries              
        { //dataSeries object

         /*** Change type "column" to "bar", "area", "line" or "pie"***/
         type: "column",
              dataPoints: [
                  { label: "January", y: jan},
                  { label: "february", y: 20 },
                  { label: "March", y: march },
                  { label: "April", y: april },
                  { label: "May", y: may },
                  { label: "June", y: june },
                  { label: "July", y: july },
                  { label: "Agust", y: augst },
                  { label: "September", y: sept },
                  { label: "october", y: oct },
                  { label: "November", y: nov },
                  { label: "Descember", y: desc },
              ]
             
       }
       ]
     });
            
    chart.render();
  }
    </script>
  <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>--%>


   <%-- <script type="text/javascript">
        window.onload = function () {
            var jan = parseInt(document.getElementById('<%=janhdn1.ClientID%>').value);
            var feb = parseInt(document.getElementById('<%=febhdn.ClientID%>').value);
            var march = parseInt(document.getElementById('<%=marchhdn.ClientID%>').value);
            var april = parseInt(document.getElementById('<%=aprilhdn.ClientID%>').value);
            var may = parseInt(document.getElementById('<%=mayhdn.ClientID%>').value);
            var june = parseInt(document.getElementById('<%=junehdn.ClientID%>').value);
            var july = parseInt(document.getElementById('<%=junehdn.ClientID%>').value);
            var augst = parseInt(document.getElementById('<%=aughdn.ClientID%>').value);
            var sept = parseInt(document.getElementById('<%=septhdn.ClientID%>').value);
            var oct = parseInt(document.getElementById('<%=octhdn.ClientID%>').value);
            var nov = parseInt(document.getElementById('<%=novhdn.ClientID%>').value);
            var desc = parseInt(document.getElementById('<%=deschdn.ClientID%>').value);
            var chart = new CanvasJS.Chart("chartContainer", {

                title: {
                    text: "My First Chart in CanvasJS"
                },
                data: [
                    {
                        // Change type to "doughnut", "line", "splineArea", etc.
                        type: "column",
                        dataPoints: [
                            { label: "january", y: jan },
                            { label: "february", y: feb },
                            { label: "March", y: march },
                            { label: "April", y: april },
                            { label: "May", y: may },
                            { label: "june", y: june },
                            { label: "July", y: july },
                            { label: "August", y: augst },
                            { label: "September", y: sept },
                            { label: "October", y: oct },
                            { label: "November", y: nov },
                            { label: "December", y: desc }
                        ]
                    }
                ]
            });
            chart.render();
        }
    </script>--%>
    

 <%-- <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>--%>

</head>
<body>
    <form id="form1" runat="server">
       <%-- <div id="chartContainer" style="height:300px; width: 50%;">
        </div>--%>
        <figure class="highcharts-figure">
		<div id="container"></div>
		<p class="highcharts-description">
			Chart with buttons to modify options, showing how options can be changed
			on the fly. This flexibility allows for more dynamic charts.
		</p>
	
		<button id="plain">Plain</button>
		<button id="inverted">Inverted</button>
		<button id="polar">Polar</button>
	</figure>
         <div>
        <asp:HiddenField id="janhdn1"  runat="server" />
        <asp:HiddenField ID="febhdn"  runat="server" />
        <asp:HiddenField ID="marchhdn" runat="server" />
        <asp:HiddenField ID="aprilhdn" runat="server" />
        <asp:HiddenField ID="mayhdn" runat="server" />
        <asp:HiddenField ID="junehdn" runat="server" />
        <asp:HiddenField ID="julyhdn" runat="server" />
        <asp:HiddenField ID="aughdn" runat="server" />
        <asp:HiddenField ID="septhdn" runat="server" />
        <asp:HiddenField ID="octhdn" runat="server" />
        <asp:HiddenField ID="novhdn" runat="server" />
        <asp:HiddenField ID="deschdn" runat="server" />
    </div>




       
        
    </form>

    <script >
        debugger
        var jan = parseInt(document.getElementById('<%=janhdn1.ClientID%>').value);
        var feb = parseInt(document.getElementById('<%=febhdn.ClientID%>').value);
        const chart = Highcharts.chart('container', {
            title: {
                text: 'Unemployment rates in engineering and ICT subjects, 2021',
                align: 'left'
            },
            subtitle: {
                text: 'Chart option: Plain | Source: ' +
                    '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                    'target="_blank">NAV</a>',
                align: 'left'
            },
            xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            },
            series: [{
                type: 'column',
               
                colorByPoint: true,
                data: [jan, feb],
                showInLegend: false
            }]
        });

        document.getElementById('plain').addEventListener('click', () => {
            chart.update({
                chart: {
                    inverted: false,
                    polar: false
                },
                subtitle: {
                    text: 'Chart option: Plain | Source: ' +
                        '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                        'target="_blank">NAV</a>'
                }
            });
        });

        document.getElementById('inverted').addEventListener('click', () => {
            chart.update({
                chart: {
                    inverted: true,
                    polar: false
                },
                subtitle: {
                    text: 'Chart option: Inverted | Source: ' +
                        '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                        'target="_blank">NAV</a>'
                }
            });
        });

        document.getElementById('polar').addEventListener('click', () => {
            chart.update({
                chart: {
                    inverted: false,
                    polar: true
                },
                subtitle: {
                    text: 'Chart option: Polar | Source: ' +
                        '<a href="https://www.nav.no/no/nav-og-samfunn/statistikk/arbeidssokere-og-stillinger-statistikk/helt-ledige"' +
                        'target="_blank">NAV</a>'
                }
            });
        });

    </script>

</body>
</html>
