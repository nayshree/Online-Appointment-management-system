<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="manage_profession.aspx.cs" Inherits="OAMS.manage_profession" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <center><h3>Manage Professions and Specialization</h3></center>
     
       <div>
         <asp:Repeater ID="ProfessionRepeater" runat="server">  
            <HeaderTemplate>  
                <table border="1" style="border-radius:5px;" class="table table-responsive-lg table-striped mx-auto w-400">  
                    <thead class="thead-dark">
                    <tr>  
                         
                            <th scope="col">  
                                Profession Type  
                            </th>  
                            
                            <th scope="col">  
                                Specialization
                            </th>  
                            
                            <th scope="col" style="text-align:center;">  
                               Update Record
                            </th> 

                            <th scope="col" style="text-align:center;">  
                                Delete Record
                            </th>  
                    </tr>
                   </thead>
            </HeaderTemplate>  
            <ItemTemplate>  
                <tr class="tblrowcolor">  
                    <td class="text-nowrap">  
                        <asp:DropDownList ID="profession_type" name="profession_type" Visible="false" runat="server" CssClass="form-control">
                                       <asp:ListItem Value="Select">Select Specialization</asp:ListItem>
                                       <asp:listitem Value="Doctor">Doctor</asp:listitem>
                                       <asp:ListItem Value="Lawyer">Lawyer</asp:ListItem>
                        </asp:DropDownList>
                         <asp:Label ID="profession_type_label" name="profession_type_label" runat="server" Text='<%#Eval("Profession_Type")%>'/>
                       
                    </td>  
                    <td>  
                        <asp:Label ID="specialization_label" name="specialization_label" runat="server" Text='<%#Eval("Details")%>'/>  
                        <asp:TextBox class="form-control" ID="specialization" Visible="false" name="specialization" text='<%#Eval("Details")%>' runat="server" Enabled="False"></asp:TextBox>
                    </td>  
                    <td style="text-align:center;">  
                       <asp:LinkButton ID="updaterecord" name="edit" class="btn btn-info" type="submit" runat="server" OnClick="updaterecord_click"><i class="fa fa-edit"></i></asp:LinkButton>
                        &nbsp&nbsp;
                        <asp:Button ID="done_updation" name="done_updation" class="btn btn-success" type="submit" runat="server" OnClick="doneupdation_click" Text="&#x2714;"></asp:Button>
                    </td>  

                    <td style="text-align:center;">  
                        <asp:LinkButton ID="deleterecord" name="delete" class="btn btn-danger" type="submit" runat="server" OnClick="deleterecord_click"><i class="fa fa-trash"></i></asp:LinkButton>
                    </td>  
                </tr>  
            </ItemTemplate>  
           
            <FooterTemplate>  
                   
                        <table border="1" style="border-radius:5px;" class="table table-responsive-lg table-striped mx-auto w-400">
                           <tr>
                               <td class="w-25">
                                   <asp:DropDownList ID="professiontype_new" name="professiontype_new" runat="server" CssClass="form-control">
                                       <asp:ListItem Value="Select">&nbsp;&nbsp;Select Profession Type</asp:ListItem>
                                       <asp:listitem Value="Doctor">&nbsp;&nbsp;Doctor</asp:listitem>
                                       <asp:ListItem Value="Lawyer">&nbsp;&nbsp;Lawyer</asp:ListItem>
                                   </asp:DropDownList>
                                </td>
                               <td class="w-50">
                                    <asp:TextBox ID="specialization_new" class="form-control" name="specialization_new" runat="server" placeholder="Enter Specialization"></asp:TextBox>
                                </td>
                               <td style="text-align:center;">
                                    <asp:Button ID="addnewprofession" name="addnewprofession" class="btn btn-primary" type="submit" runat="server" OnClick="addnewprofession_click" Text="+ Add New Profession"></asp:Button>
                                </td>
                           </tr>
                       </table>
                 
                </table>  
            </FooterTemplate>  
        </asp:Repeater>
           
          
       </div>
</body>
</html>

</asp:Content>
