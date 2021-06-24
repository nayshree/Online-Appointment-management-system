<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="login.aspx.cs" Inherits="OAMS.login"  %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
<div class="container">
      <div class="row">
         <div class="col-md-4 mx-auto">
            <div class="card shadow-lg">
               <div class="card-body">
                  <div class="row">
                     <div class="col text-center">
                        
                           <img width="150" src="images/generaluser.png"/>
                        
                     </div>
                  </div>
                   <br />
                  <div class="row">
                     <div class="col text-center">
                        
                           <h3>Login</h3>
                        
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <br />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Email id" TextMode="Email"></asp:TextBox>
                        </div>
                        <br />
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                </div>
                      
                   <br />
                   <div class="row">
                     <div class="col-12">
                           <div class="form-group">
                              <asp:Button type="button" class="btn btn-primary btn-block" style="width:100%;" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                           </div>                     
                     </div>
                     </div><br />
                   <div class="row">
                       <div class="col text-center">
                           <asp:LinkButton ID="LinkButton1" style="text-decoration:none;" runat="server" OnClick="LinkButton1_Click" >Forgot password?</asp:LinkButton>
                       </div>
                   </div>
                     </div>
                  </div>
                  
               </div>
            </div>
            <br /><br /><br /><br /><br />
         </div>
      
  
</asp:Content>