<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="OAMS._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="images/bg1.jpg" width="100%" height="20%"/>
   </section>

    <br />
    <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Our Features</h2>
                  <p><b>Our 3 Primary Features -</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img src="images/meeting.png" width="150px"/>
                  <h4>Appointment On Time</h4>
                  <p class="text-justify">We should the value and respect the importance of time every single moment. We should not waste time at all till the end moment of our life. We provide seamless process in Appointment Booking and a timely completion of task.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                   <img src="images/book-online.png" width="150px"/>
                  <h4>Secure Process</h4>
                  <p class="text-justify"> a secure online Appointment booking system is required to help mitigate the uncertainty that surrounds booking online in this day and age. But how does OASM online appointment booking software ensure a secure booking system</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img src="images/consulting.png" width="150px"/>
                  <h4>Privacy at peak</h4>
                  <p class="text-justify">We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.</p>
               </center>
            </div>
         </div>
      </div>
   </section>

     <section>
      <img src="images/bg4.jpg" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12">
               <center>
                  <h2>Our Process</h2>
                  <p><b>We have a Simple 3 Step Process</b></p>
               </center>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
               <center>
                  <img width="150px" src="images/sign-up.png" />
                  <h4>SignUp / SignIn</h4>
                  <p class="text-justify">Get Started by providing us your valuable data and we'll be keeping it secure.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="images/book.png"/>
                  <h4>Book Appointment</h4>
                  <p class="text-justify">Book an Appointment by providing the date and time  and paying a very small amount of fees.</p>
               </center>
            </div>
            <div class="col-md-4">
               <center>
                  <img width="150px" src="images/feedback.png"/>
                  <h4>Feedback</h4>
                  <p class="text-justify">information or comments about something that you have done which tells you how good or bad it is, every feedback is valuable to us</p>
               </center>
            </div>
         </div>
      </div>
   </section>
</asp:Content>
