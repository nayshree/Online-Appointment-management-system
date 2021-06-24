<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="viewAppointment.aspx.cs" Inherits="OAMS.viewAppointment" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">
    <div class="container mb-5">
        <center><h2>View Appointment</h2></center>
    </div>
        <div class="container-fluid">
      <asp:Repeater ID="Viewappointments" runat="server">  
            <HeaderTemplate>  
                <table border="2" class="table" style="background-color:white;">  
                    <thead class="thead-dark">
                    <tr>  
                         
                            <th scope="col">  
                                Name  
                            </th>  
                            
                            <th scope="col">  
                               Email_ID 
                            </th>  
                            
                            <th scope="col">  
                               Phone_No 
                            </th> 

                            <th scope="col">  
                                Gender 
                            </th> 

                            <th scope="col">  
                                DOB 
                            </th> 

                            <th scope="col">  
                                City 
                            </th> 

                            <th scope="col">  
                                State 
                            </th> 

                            <th scope="col">  
                                Pincode 
                            </th> 
                          
                            <th scope="col">  
                                Date
                            </th> 

                            <th scope="col">  
                                Time
                            </th> 
                    </tr>
                   </thead>
            </HeaderTemplate>  
            <ItemTemplate>  
                <tr class="tblrowcolor">  
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.Name")%>  
                    </td>  
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.Email_ID")%>  
                    </td>  
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.Phone_No")%>  
                    </td>  

                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.Gender")%>  
                    </td>  
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.DateOfBirth")%>  
                    </td>  
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.City")%>  
                    </td>  
                    <td>
                        
                        <%#DataBinder.Eval(Container,"DataItem.State")%>  
                    </td>  
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.Pincode")%>  
                    </td>  
                     <td>  
                        <%#DataBinder.Eval(Container,"DataItem.Date")%>  
                    </td>  
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.Time")%>  
                    </td>  
                
                </tr>  
            </ItemTemplate>   
            
            <FooterTemplate>  
               
                </table>  
            </FooterTemplate>  
        </asp:Repeater>  
        </div>
    
</asp:Content>