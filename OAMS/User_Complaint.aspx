<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="User_Complaint.aspx.cs" Inherits="OAMS.User_Complaint" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
   <form id="form3">
       <center><h3>Register Complaint</h3></center>
    <div> 
        <asp:Repeater ID="complaint" runat="server">
    <HeaderTemplate>
		
    </HeaderTemplate>
            <ItemTemplate>
			
                
	<!-- Card Start -->
	<div class="card" >
		<div class="card-body">		

			<div class="row">
				<div class="col-12">

					<div class="row">
						<div class="col-md-12"><h3 style="background-color:grey; color:white;"> &nbsp<%#DataBinder.Eval(Container,"DataItem.Name")%></h3></div>
					</div>

					<div class="row">
						<div class="col-md-6"><h4>Email Id : <%#DataBinder.Eval(Container,"DataItem.Email_Id")%></h4>  </div>
						<div class="col-md-6"><h4>Appointment Date : <%#DataBinder.Eval(Container,"DataItem.AppDate")%></h4> </div>
					</div>

					<div class="row">
						<div class="col-md-6"><h4>Appointment Time : <%#DataBinder.Eval(Container,"DataItem.time")%></h4> </div>
						<div class="col-md-6">
							<asp:DropDownList class="custom-select" ID="type" name="type" runat="server">
									<asp:ListItem Value="0" >-- Select --</asp:ListItem>
									<asp:ListItem Value="Address Related">Address Related</asp:ListItem>
									<asp:ListItem Value="Fees Related">Fees Related</asp:ListItem>
									<asp:ListItem Value="Service Related">Service Related</asp:ListItem>
									<asp:ListItem Value="Authenticity Related">Authenticity Related</asp:ListItem>
									<asp:ListItem Value="Others">Others</asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-12"> 
							<asp:TextBox TextMode="MultiLine" class="form-group" style="width:100%;" ID="desc" name="desc" runat="server" Rows="4" ></asp:TextBox>
							<asp:TextBox class="form-group" ID="uuid" Visible="false" name="uuid" text='<%#DataBinder.Eval(Container,"DataItem.uid")%>'  runat="server"></asp:TextBox> 
						</div>
					</div>

					<div class="row">
						<div class="col-md-12"> <asp:button class="btn btn-success" name="bttn" type="submit" Text="submit" runat="server" OnClick="Complaint_Insert"></asp:button> </div>
					</div>

				</div>			
			</div>


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


