<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="adminfeedbacks.aspx.cs" Inherits="OAMS.adminfeedbacks" EnableEventValidation="false"%>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
   
             <center><h3>Feedbacks</h3></center>
        <div>
            <asp:Repeater ID="FeedbacksRepeater" runat="server">  
            <HeaderTemplate>  
                <table border="1" style="border-radius:5px;" class="table table-striped">  
                    <thead class="thead-dark">
                    <tr>     
                            
                            <th scope="col">  
                               Ratings  
                            </th> 

                            <th scope="col">  
                                Feedback Message 
                            </th> 
                            <th scope="col">  
                                Feedback From (User Id)
                            </th> 

                    </tr>
                   </thead>
            </HeaderTemplate>  
            <ItemTemplate>  
                <tr class="tblrowcolor">  

                    <td>  
                        <%#Eval("Ratings")%>  
                    </td>  

                    <td>  
                        <%#Eval("Comments")%>  
                    </td>  
                    <td>
                        <%#Eval("From_UID")%>  
                    </td>
                     <td style="display:none">  
                         
                        <asp:TextBox class="form-group" ID="uid" Visible="false" name="uid" text='<%#Eval("UID")%>'  runat="server"></asp:TextBox>
                    </td>
                    
                </tr>  
            </ItemTemplate>  
           
          
            <FooterTemplate>  
               
                </table>  
            </FooterTemplate>  
        </asp:Repeater>  
        </div>
    
</body>
</html>
</asp:Content>