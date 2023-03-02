<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="Calender.aspx.cs" Inherits="AttedancePortal.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js'></script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'
            });
            calendar.render();
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
   <table>
                                <tr>
                                    <td>
                                        <div id='calendar' ></div>
                                        <asp:Calendar ID="calendar1" runat="server"></asp:Calendar>
                                        <%--<asp:Calendar ID="calendar" runat="server"   Height="200px" ShowGridLines="True" Width="220px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
                                             />
                                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <OtherMonthDayStyle ForeColor="#CC9966" />
                                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                            <SelectorStyle BackColor="#FFCC66" />
                                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                        </asp:Calendar>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="Date" HeaderText="Date" />
                                                <asp:BoundField DataField="Description" HeaderText="Description"  />
                                            </Columns>
                                              
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                            <RowStyle BackColor="White" />
                                              
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#808080" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#383838" />
                                           
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
    </div>
</asp:Content>
