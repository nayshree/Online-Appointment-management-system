<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="User_viewappointment.aspx.cs" Inherits="OAMS.User_viewappointment" EnableEventValidation ="False"%>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
   <form id="form4">
       <center><h3>Appointments Booked</h3></center>
    <div>  
        <asp:Repeater ID="userappointment" runat="server">  
            <HeaderTemplate>  
                <table border="2" class="table" style="background-color:white;">  
                    <thead class="thead-dark">
                    <tr>  
                         
                            <th scope="col">  
                                Consultant Name  
                            </th>  
                            
                            <th scope="col">  
                               Email_ID 
                            </th>  
                            
                            <th>
                                Appointment Date
                            </th>
                            
                            <th>
                                Appointment time
                            </th>
                          
                            <th scope="col">  
                                Address
                            </th> 

                            <th scope="col">  
                                City
                            </th> 
 

                            <th scope="col">  
                                Status 
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
                        <%#DataBinder.Eval(Container,"DataItem.AppDate")%>  
                    </td> 

                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.time")%>  
                    </td>  
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.add_line1")%>  
                     
                        <%#DataBinder.Eval(Container,"DataItem.add_line2")%>  
                    </td>  
                      
                    <td>  
                        <%#DataBinder.Eval(Container,"DataItem.City")%>  
                    </td>  
                      
                    <td class="badge badge-success align-content-center">  
                         <%#DataBinder.Eval(Container,"DataItem.status")%>  
                    </td>  
                
                </tr>  
            </ItemTemplate>  
           
          
            <FooterTemplate>  
               
                </table>  
            </FooterTemplate>  
        </asp:Repeater>  
    </div>  
    </form>  
</body>
</html>
</asp:Content>