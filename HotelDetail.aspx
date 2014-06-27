﻿<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="HotelDetial, App_Web_1um1ow1d" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link type="text/css" rel="stylesheet" href="css/updown.css" />
    <link type="text/css" rel="stylesheet" href="css/test.css" />
    <script type="text/javascript" src="script/zzsc.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#updown").css("top", window.screen.availHeight / 2 + "px");
            $(window).scroll(function () {
                if ($(window).scrollTop() >= 100) {
                    $('#updown').fadeIn(300);
                } else {
                    $('#updown').fadeOut(300);
                }
            });
            $('#to_rooms_rates').click(function () { $('html,body').animate({ scrollTop: $('#ContentPlaceHolder1_GridView1').offset().top }, 800); });
            $('#to_hotel_description').click(function () { $('html,body').animate({ scrollTop: $('#hotel_description').offset().top }, 800); });
            $('#to_amenities').click(function () { $('html,body').animate({ scrollTop: $('#amenities').offset().top }, 800); });
            $('#to_comment').click(function () { $('html,body').animate({ scrollTop: $('#comment').offset().top }, 800); });
            $('#choose_a_room').click(function () { $('html,body').animate({ scrollTop: $('#ContentPlaceHolder1_GridView1').offset().top }, 800); });
            $('#updown .up').click(function () { $('html,body').animate({ scrollTop: '0px' }, 800); });
            $('#updown .down').click(function () { $('html,body').animate({ scrollTop: document.body.clientHeight + 'px' }, 800); });
            $('#myStat').circliful();
            $('#Div1').circliful();

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="mainBody">
        <div id="updown"><span class="up"></span></div>
        <div class="position">
            <ul id="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="SearchResult.aspx?Address=<%=Request["Address"] %>&CheckIn=<%=Request["CheckIn"] %>&CheckOut=<%=Request["CheckOut"] %>&RoomNum=<%=Request["RoomNum"] %>&GuestNum=<%=Request["GuestNum"] %>">Find a Hotel</a></li>
                <li><a href="#">Room Specific</a></li>
            </ul>

        </div>
        <div class="hotel">
            <div class="name">
                <%=hotel.Name%>
                <%for (int i = 0; i < hotel.StarLevel; i++)
                  { %>
                <img src="image/star.png" class="star" alt="star" />
                <%} %>
            </div>
            <br />
            <br />
            <span><%=hotel.Address %></span><br />
            <span><%=hotel.ContactNumber %></span>
        </div>
        <div class="nav">
            <ul>
                <li class="cur"><a href="#" id="to_rooms_rates">Rooms & Rates</a></li>
                <li><a href="#" id="to_hotel_description">Hotel Description</a></li>
                <li><a href="#" id="to_amenities">Amenities</a></li>
                <li><a href="#" id="to_comment">Guest Ratings</a></li>
            </ul>
            <div class="curBg"></div>
            <div class="cls"></div>
        </div>
        <br />
        <br />
        <div class="detail1">
            <div class="imgbox">
                <img src="<%=@"image/hotel/" + hotel.ImageUrl%>" alt="img" style="border:4px solid black"/>
            </div>
            <div class="roomInfo">
                <div id="Div1" data-dimension="100" data-text="<%=AvaRating.ToString() %>" data-info="" data-width="10" data-fontsize="40" data-percent="<%=(AvaRating*10).ToString() %>" data-fgcolor="#336699" data-bgcolor="#eee" data-fill="#ddd" style="float:left"></div>
                <div style="margin-left: 40px;float:left;min-width:300px;min-height:110px">
                    <span style="color: gray">OVERALL GUEST SCORE</span><br />
                    <span style="color: #336699; font-size: xx-large">
                        <%=AvaRatingString %>

                    </span>
                    <br />
                    Based on ratings from <%=comment.Count.ToString() %> guests.
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <p>Check in:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Visible="true"></asp:Label></p>
                        <p>Check out:&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Visible="true"></asp:Label></p>
                        <p>Details:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Visible="true"></asp:Label></p>
                        <asp:Button ID="Button1" runat="server" Text="Change Dates" OnClick="Button1_Click" CssClass="check" />
                        <hr />

                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <asp:Button ID="Button2" runat="server" class="datePickerButton" Text="Check In" CssClass="datacheck" OnClick="Button2_Click" />
                            <asp:Button ID="Button3" runat="server" class="datePickerButton" Text="Check Out" CssClass="datacheck" OnClick="Button3_Click" /><br />
                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999"
                                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                ForeColor="Black" Height="180px"
                                Width="200px" Visible="False"
                                OnSelectionChanged="Calendar1_SelectionChanged" CellPadding="4">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" Font-Bold="True" BorderColor="Black" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                            <!------------ 日历2 ------------>
                            <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999"
                                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                ForeColor="Black" Height="180px"
                                Width="200px" Visible="False" class="inputCheckOut"
                                OnSelectionChanged="Calendar2_SelectionChanged" CellPadding="4">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" Font-Bold="True" BorderColor="Black" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                            <asp:DropDownList ID="DropDownList1" runat="server" class="inputElse">
                                <asp:ListItem>1 Room</asp:ListItem>
                                <asp:ListItem>2 Rooms</asp:ListItem>
                                <asp:ListItem>3 Rooms</asp:ListItem>
                                <asp:ListItem>4 Rooms</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DropDownList2" runat="server" class="inputElse">
                                <asp:ListItem>1 Guest</asp:ListItem>
                                <asp:ListItem>2 Guests</asp:ListItem>
                                <asp:ListItem>3 Guests</asp:ListItem>
                                <asp:ListItem>4 Guests</asp:ListItem>
                            </asp:DropDownList>


                            <asp:Button ID="Button4" runat="server" Text="Check Availability" CssClass="checkAvailability" OnClick="Button4_Click" />
                            <hr />
                        </asp:Panel>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <span>from $<b><%=price %> </b>per night</span>
                <div id="choose_a_room" class="chooseARoom">&nbsp;&nbsp;Choose a room&nbsp;&nbsp;</div>

            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="roomDetail">
                    <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="False" CellPadding="20" DataKeyNames="HotelId,RoomType" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="970px" OnDataBound="GridView1_DataBound">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="RoomType" HeaderText="Room Type" ReadOnly="True" SortExpression="RoomType">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FullRate" HeaderText="Full Rate" SortExpression="FullRate">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TotalNumber" HeaderText="Total Number" SortExpression="TotalNumber">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:CommandField SelectText="Select" ShowSelectButton="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" EntityTypeName="" ContextTypeName="DataClassesDataContext" TableName="Table_Room" Where="HotelId == @HotelId1" EnableDelete="True" EnableUpdate="True">
                        <WhereParameters>
                            <asp:QueryStringParameter Name="HotelId1" QueryStringField="hotelId" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>

                    <asp:Panel ID="Panel2" runat="server" Visible="true">
                        <div class="title">
                            <%=GridView1.SelectedRow.Cells[0].Text %> Detail of Next Week
            <asp:Button ID="Button_BookNow" runat="server" CssClass="booknow" Text="Book Now!" OnClick="Button_BookNow_Click" />
                        </div>
                        <div class="item">
                            <table cellpadding="8" style="width: 950px">
                                <tr>
                                    <td></td>
                                    <%foreach (Table_Arrangement a in _arrangement)
                                      { %>
                                    <td align="center"><%=a.Date.ToString("MM/dd/yyyy")%></td>
                                    <%} %>
                                </tr>
                                <tr>
                                    <td>Rate</td>
                                    <%foreach (Table_Arrangement a in _arrangement)
                                      { %>
                                    <td align="center"><%="$"+a.Rate.ToString() %></td>
                                    <%} %>
                                </tr>
                                <tr>
                                    <td>Availability</td>
                                    <%foreach (Table_Arrangement a in _arrangement)
                                      { %>
                                    <td align="center">
                                        <% if (Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text) - a.BookedNumber >= RoomNum)
                                           {%>
                                        <img alt="yes" src="image/3284.png" style="max-width: 20px;" />
                                        <%}
                                           else
                                           {%>
                                        <img alt="no" src="image/3227.png" style="max-width: 20px;" />
                                        <%} %>
                                        <%} %>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="hotelDescription" id="hotel_description">
            <div class="info">
                <div class="roomNum">
                    <%="Rooms: "+TotalRoomNum.ToString() %>
                </div>
                <div class="time">
                    <%="Check in time: "+hotel.CheckInTime %>
                </div>
                <div class="time">
                    <%="Check out time: "+hotel.CheckOutTime %>
                </div>
            </div>
            <h1 class="title">Hotel Description</h1>
            <div class="hotelDetail">
                <%=hotel.Description %>
            </div>

        </div>
        <div class="Amenities" id="amenities">
            <h1 class="title">Amenities</h1>
            <%if (hotel.isBusinessCenter == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/tie.png" alt="bs" />
                <div class="text">Business Center</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/tie.png" alt="bs" />
                <div class="text"><s>Business Center</s></div>
            </div>
            <%} %>
            <%if (hotel.isFitnessCenter == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/trainers.png" alt="bs" />
                <div class="text">Fitness Center</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/trainers.png" alt="bs" />
                <div class="text"><s>Fitness Center</s></div>
            </div>
            <%} %>
            <%if (hotel.isNonSmoking == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/no_smoking_512.png" alt="bs" />
                <div class="text">Non Smoking</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/no_smoking_512.png" alt="bs" />
                <div class="text"><s>Non Smoking</s></div>
            </div>
            <%} %>
            <%if (hotel.isPetsAllowed == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/dog_2.png" alt="bs" />
                <div class="text">Pets Allowed</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/dog_2.png" alt="bs" />
                <div class="text"><s>Pets Allowed</s></div>
            </div>
            <%} %>
            <%if (hotel.isFreeBreakfast == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/f0f4.png" alt="bs" />
                <div class="text">Free Breakfast</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/f0f4.png" alt="bs" />
                <div class="text"><s>Free Breakfast</s></div>
            </div>
            <%} %>
            <%if (hotel.isFreeInternet == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/wifi.png" alt="bs" />
                <div class="text">Free Internet</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/wifi.png" alt="bs" />
                <div class="text"><s>Free Internet</s></div>
            </div>
            <%} %>
            <%if (hotel.isSwimmingPool == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/swimming.png" alt="bs" />
                <div class="text">Swimming Pool</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/swimming.png" alt="bs" />
                <div class="text"><s>Swimming Pool</s></div>
            </div>
            <%} %>
            <%if (hotel.isAirportShuttle == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/bus.png" alt="bs" />
                <div class="text">Airport Shuttle</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/bus.png" alt="bs" />
                <div class="text"><s>Airport Shuttle</s></div>
            </div>
            <%} %>
            <%if (hotel.isFreeParking == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/car.png" alt="bs" />
                <div class="text">Free Parking</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/car.png" alt="bs" />
                <div class="text"><s>Free Parking</s></div>
            </div>
            <%} %>
            <%if (hotel.isAccessible == 1)
              { %>
            <div class="box_available">
                <img class="img" src="image/wheelchair.png" alt="bs" />
                <div class="text">Accessible</div>
            </div>
            <%}
              else
              { %>
            <div class="box_not_available">
                <img class="img" src="image/wheelchair.png" alt="bs" />
                <div class="text"><s>Accessible</s></div>
            </div>
            <%} %>
        </div>
        <div class="comment" id="comment">
            <h1 class="title">Guest Ratings</h1>

            <div class="sum">
                <div id="myStat" data-dimension="100" data-text="<%=AvaRating.ToString() %>" data-info="" data-width="10" data-fontsize="40" data-percent="<%=(AvaRating*10).ToString() %>" data-fgcolor="#336699" data-bgcolor="#eee" data-fill="#ddd" style="float: left"></div>
                <div style="margin-left: 40px;float:left">
                    <span style="color: gray">OVERALL GUEST SCORE</span><br />
                    <span style="color: #336699; font-size: xx-large">
                        <%=AvaRatingString %>

                    </span>
                    <br />
                    Based on ratings from <%=comment.Count.ToString() %> guests.
                </div>
            </div><br /><hr style="width:95%" /><br />
            <div class="content">
                <%foreach(Table_Comment c in comment){ %>
                <span style="color: black; font-size: xx-large"><%=c.Score.ToString()%></span>
                <span style="font-family:'Microsoft YaHei';font-size:large;color:#336699;font-weight:normal;margin-left:20px;"><%=Rating(c.Score) %></span>
                <div ><%=c.Comment %></div>
                <br />
                <div style="font-size:small;float:right"><%="by "+c.CustomerEmail +", "+c.Date.ToString("MM/dd/yyyy")%></div>
                <br />
                <hr style="width:100%" />

                <%} %>
            </div>




        </div>
    </div>
</asp:Content>

