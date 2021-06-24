<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="Consultant_Complaint.aspx.cs" Inherits="OAMS.Consultant_Complaint" EnableEventValidation="false"%>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
   <form id="form4">
       <center><h3>Register Complaint</h3></center>
    <div> 
        <asp:Repeater ID="concomplaint" runat="server">
    <HeaderTemplate>
		
    </HeaderTemplate>
            <ItemTemplate>
			
                
	<!-- Card Start -->
	<div class="card" >
		<div class="card-body">		
			<table class="tabel table-striped table-hover">
							<thead>
								<tr>
									<th>
									User Name :
								</th>
								<th>
								<%#DataBinder.Eval(Container,"DataItem.Name")%>
								</th>
								</tr>
								
							</thead>
							<tbody>
								<tr>
									<td>
										Email Id :
									</td>
									<td>
										<%#DataBinder.Eval(Container,"DataItem.Email_Id")%> 
									</td>
								</tr>
								<tr>
									<td>
										Appointment Date :
									</td>
									<td>
										<%#DataBinder.Eval(Container,"DataItem.AppDate")%> 
									</td>
								</tr>
								<tr>
									<td>
										Appointment Time :
									</td>
									<td>
										<%#DataBinder.Eval(Container,"DataItem.time")%> 
									</td>
								</tr>
								   
							<tr>
								<th scope="row">Type :</th>
								<td>
									<asp:DropDownList ID="type" name="type" runat="server">
									<asp:ListItem Value="0" >-- Select --</asp:ListItem>
									<asp:ListItem Value="Behaviour Related">Behaviour Related</asp:ListItem>
									<asp:ListItem Value="Fees Related">Fees Related</asp:ListItem>
									<asp:ListItem Value="Schedule Related">Schedule Related</asp:ListItem>
									<asp:ListItem Value="Authenticity Related">Authenticity Related</asp:ListItem>
									<asp:ListItem Value="Others">Others</asp:ListItem>
								</asp:DropDownList>
								</td>
							</tr>
								
								
				                <tr>
									<th scope="row">
										Description :
									</th>
									<td>
									<asp:TextBox class="form-group" ID="desc" name="desc" runat="server" ></asp:TextBox>
								<asp:TextBox class="form-group" ID="uuid" Visible="false" name="uuid" text='<%#DataBinder.Eval(Container,"DataItem.uid")%>'  runat="server"></asp:TextBox>
				
									</td>
				                </tr>
								
								<tr>
									<td colspan="2"> 
										<asp:button class="btn btn-success" name="bttn" type="submit" Text="submit" runat="server" OnClick="Con_Complaint"></asp:button>				

									</td>
								</tr>
										

								</tbody>
				</table>
								
								   
					</div>
			</div>
		

            </ItemTemplate>
			<FooterTemplate>
				
			</FooterTemplate>
            </asp:Repeater>
	      </div>  
    </form>  
</body>
</html>

</asp:Content>
