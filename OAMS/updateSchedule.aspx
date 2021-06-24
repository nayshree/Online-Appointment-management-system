<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Dashboard.Master" CodeBehind="updateSchedule.aspx.cs" Inherits="OAMS.updateSchedule" %>

 <asp:Content ID="Content2" ContentPlaceHolderID="cpmain" runat="server">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
   
    <div class="container mb-5">
        <center><h2>Schedule</h2></center>
    </div>
    <div class="container-fluid" style="border-style:solid;border-color:black; border-radius:10px; background-color:white;">
         <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputEmail4">Start Date</label>
              <input type="date" class="form-control" id="sdate" runat="server">
            </div>
            <div class="form-group col-md-6">
              <label for="inputPassword4">End Date</label>
              <input type="date" class="form-control" id="edate" runat="server">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
              <label for="inputEmail4">Start Time</label>
              <input type="time" class="form-control" id="stime" runat="server">
            </div>
            <div class="form-group col-md-6">
              <label for="inputPassword4">End Time</label>
              <input type="time" class="form-control" id="etime" runat="server">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-2">
              <label for="inputEmail4">Limit</label>
              <input type="text" class="form-control" id="limit" runat="server">
            </div>
        </div>
        <div class="form-row">
             <button class="btn btn-success" type="submit" runat="server" >Submit</button>
        </div>
    </div>
</body>
</html>
 </asp:Content>