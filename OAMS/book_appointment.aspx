<%@ Page Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="book_appointment.aspx.cs" Inherits="OAMS.book_appointment" EnableEventValidation="false" %>


<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server"> 

<h2>Book Appointment</h2>
    
    <div class="card shadow">
        <div class="card-body">
        
            <div class="row form-group">
                <div class="col">
                    <label for="select1">Select</label>
                    <asp:DropDownList class="custom-select" name="select1" id="select1" runat="server" OnSelectedIndexChanged="get_profession" AutoPostBack="true">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                        <asp:ListItem value="1">Lawyer</asp:ListItem>
                        <asp:ListItem value="2">Doctor</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col">
                    <label for="search">Search</label>
                    <input type="text" class="form-control" name="Search" id="search" runat="server"/>
                </div>
            </div>

        </div>
    </div>


   
     <asp:Repeater ID="book_appoint" runat="server">
     
        <ItemTemplate>

       <div class="card shadow">
        <div class="card-body">

            <div class="row" style="background-color:black; border-radius:6px;color:white;">
                <div class="col-md-6" ><h2 style="margin-block:auto;">  <%#DataBinder.Eval(Container,"DataItem.Name")%>  </h2></div>                     
                <div class="col-md-2 form-group-sm text-center" style="margin-block:auto;"> <asp:TextBox TextMode="Date" ID="date1" runat="server" style="border-radius:6px;" ></asp:TextBox> 
                  
                </div>
                <div class="col-md-2 form-group-sm text-center" style="margin-block:auto;"> <asp:TextBox TextMode="time" ID="time1" runat="server" style="border-radius:6px;"></asp:TextBox> 
                   
                </div>
                <div class="col-md-2 text-center" style="margin-block:auto;"><asp:Button runat="server" ID="book_btn" class="btn btn-sm btn-block btn-primary" type="button" onclick="user_booking" text="Request Booking"></asp:Button></div>
                <asp:TextBox ID="cid" Class="form-group" Text='<%#DataBinder.Eval(Container,"DataItem.cid")%>' runat="server" Visible="false"></asp:TextBox>
            </div>
           
            <hr />
            <div class="row">
                <div class="col"><h4 class="badge badge-dark d-block" style="font-size:18px;">Qualifications:</h4>                
                <div class="row">
                    <div class="col">
                   <ul>
                       <li><h5><%#DataBinder.Eval(Container,"DataItem.Qualification_1")%></h5></li>
                       <li><h5> <%#DataBinder.Eval(Container,"DataItem.Qualification_2")%></h5></li>
                       <li><h5><%#DataBinder.Eval(Container,"DataItem.Qualification_3")%></h5></li>
                   </ul>
                </div>
                </div>
                </div>
            


                <div class="col"><h4 class="badge badge-dark d-block" style="font-size:18px;">Specialization:</h4>
                  <div class="row">
                    <div class="col">
                        <ul>
                            <li><h5><%#DataBinder.Eval(Container,"DataItem.Specialization_1")%></h5></li>
                            <li><h5> <%#DataBinder.Eval(Container,"DataItem.Specialization_2")%></h5></li>
                            <li><h5><%#DataBinder.Eval(Container,"DataItem.Specialization_3")%></h5></li>
                        </ul>
                    </div>
                  </div>
                </div>
            </div>
            <hr />
            <div class="row text-center">
                <div class="col-md-4">
                    <h4 class="badge badge-pill badge-info" style="font-size:20px;"><i class="fa fa-phone" aria-hidden="true"></i> <%#DataBinder.Eval(Container,"DataItem.Phone_No")%></h4>
                </div>
                 <div class="col-md-4">
                    <h4 class="badge badge-pill badge-info" style="font-size:20px;"></i> Monday - Saturday  <%#DataBinder.Eval(Container,"DataItem.Start_Time")%> - <%#DataBinder.Eval(Container,"DataItem.End_Time")%></h4>
                </div>
                <div class="col-md-4">
                    <h4 class="badge badge-pill badge-info" style="font-size:20px;"><i class="fa fa-envelope" aria-hidden="true"></i> <%#DataBinder.Eval(Container,"DataItem.Email_ID")%></h4>
                </div>                
            </div>
             <div class="row text-center" style="background-color:black; border-radius:6px;color:white;">
                <div class="col-12" >
                    <h4 style="margin-top:6px;" ><i class="fa fa-map-marker" aria-hidden="true"></i>  <%#DataBinder.Eval(Container,"DataItem.Add_Line1") + ", " + DataBinder.Eval(Container, "DataItem.Add_Line2") + ", " + DataBinder.Eval(Container, "DataItem.Add_line3") + ", " + DataBinder.Eval(Container, "DataItem.Landmark") + ", " + DataBinder.Eval(Container, "DataItem.Area") + ", " + DataBinder.Eval(Container, "DataItem.City") + ", " + DataBinder.Eval(Container, "DataItem.State") + ", " + DataBinder.Eval(Container, "DataItem.Pincode") %></h4>
                </div>
            </div>



        </div>
     </div>
        </ItemTemplate>
   </asp:Repeater>



</asp:Content>
