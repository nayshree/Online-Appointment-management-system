<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.Master" CodeBehind="update_profiles.aspx.cs" Inherits="OAMS.update_profile" EnableEventValidation="false" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">
    <div class="container mb-5">
        <center><h2>Update Profile</h2></center>
    </div>
    <div class="container" style="border-style:solid;border-color:black; border-radius:10px; background-color:white;">
        

        
        
           <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputEmail4">Name</label>
              <input type="text" class="form-control" name="Name" id="Name" runat="server"/>
            </div>
          </div>

            <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputEmail4">Email</label>
              <input type="email" class="form-control" name="email" id="email" runat="server"/>
            </div>
            <div class="form-group col-md-6">
              <label for="inputPassword4">Password</label>
              <input type="password" class="form-control" name="password" id="password" runat="server"/>
            </div>
          </div>
            <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputEmail4">Gender</label>
              <input type="text" class="form-control"  id="gender" runat="server"/>
            </div>
            <div class="form-group col-md-6">
              <label for="inputPassword4">Phone</label>
              <input type="text" class="form-control" name="phone" id="phone" runat="server"/>
            </div>
          </div>
          <!--<div class="form-group">
            <label for="inputAddress">Address</label>
            <input type="text" class="form-control" id="add1" placeholder="1234 Main St" runat="server">
          </div>
          <div class="form-group">
            <label for="inputAddress2">Address 2</label>
            <input type="text" class="form-control" id="add2" placeholder="Apartment, studio, or floor" runat="server">
          </div>-->
          <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputCity">City</label>
              <input type="text" class="form-control" id="city" runat="server"/>
            </div>
            <div class="form-group col-md-4">
              <label for="inputState">State</label>
              <input type="text" id="state" class="form-control" runat="server"/>
              
             </div>
            <div class="form-group col-md-2">
              <label for="inputZip">Pincode</label>
              <input type="text" class="form-control" id="pincode" runat="server"/>
            </div>
          </div>
          
          <button class="btn btn-success" type="submit" runat="server" onServerClick="Submit">Submit</button>
        
           
    </div>
</asp:Content>

