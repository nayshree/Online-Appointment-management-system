<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="User_feedback.aspx.cs" Inherits="OAMS.User_feedback" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">
 <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>feedback</title>
</head>
<body>
   <form id="form2">
       <center><h3>Register Feedback</h3></center>
    <div> 
        <asp:Repeater ID="feedback" runat="server">
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
							<asp:DropDownList class="custom-select" ID="ratings" name="ratings" runat="server">
									<asp:ListItem Value="0" >-- Ratings --</asp:ListItem>
									<asp:ListItem Value="1" Text="1">1</asp:ListItem>
									<asp:ListItem Value="2">2</asp:ListItem>
									<asp:ListItem Value="3">3</asp:ListItem>
									<asp:ListItem Value="4">4</asp:ListItem>
									<asp:ListItem Value="5">5</asp:ListItem>
							</asp:DropDownList>
						</div>
					</div>

					<div class="row">
						<div class="col-12"> 
							<asp:TextBox TextMode="MultiLine" class="form-group" style="width:100%;" ID="comment" name="comment" runat="server" Rows="4" ></asp:TextBox>
							<asp:TextBox class="form-group" ID="uid" Visible="false" name="uid" text='<%#DataBinder.Eval(Container,"DataItem.uid")%>'  runat="server"></asp:TextBox>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12"> <asp:button class="btn btn-success" name="bttn" type="submit" Text="submit" runat="server" OnClick="Feedback_insert" ></asp:button></div>
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