<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="OAMS.forgot_password" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br /><br /><br />
<div class="container">
      <div class="row text-center">
         <div class="col-md-6 mx-auto">
            <div class="card shadow-lg">
               <div class="card-body">

                   <div class="row">
                     <div class="col text-center">                        
                           <h3>Forgot password</h3>                        
                     </div>
                       <br /><br /><br />
                    
                       <div class="row">
                        <div class="col">
                
                            <div class="form-group">
                                
                                <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Enter Registered Email ID" TextMode="Email"></asp:TextBox>
                            </div>
                            </div>
                        </div>

                       <br /><br /><br />

                       <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <asp:Button type="button" class="btn btn-primary btn-block" style="width:100%;" ID="Button1" runat="server" Text="Send Link" OnClick="SendEmail"/>
                            </div>                     
                        </div>
                       </div>
                      

                   </div>
                </div>
                </div>
           
             <br /><br /><br /><br /><br /><br /><br />        
            </div>
          
        </div>
    </div>
</asp:Content>

