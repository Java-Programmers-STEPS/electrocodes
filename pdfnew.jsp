<%@page import="java.sql.*"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="pass.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Invoice</title>
    <style>
       
       .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
    }
    
    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }
    
    .invoice-box table td {
        padding: 5px;
        vertical-align: top;
    }
    
    .invoice-box table tr td:nth-child(2) {
        text-align: right;
    }
    
    .invoice-box table tr.top table td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.top table td.title {
        font-size: 18px;
        line-height: 30px;
        color: #000000;
    }
    
    .invoice-box table tr.information table td {
        padding-bottom: 40px;
    }
    
    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
        text-align: left;
    }
    
    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.item.second td{
        border-bottom: 1px solid #eee;
        text-align: left;
    }
    
    .invoice-box table tr.item.last td {
        border-bottom: none;
        
    }
    
    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
    
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }
        
        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }
    
    /** RTL **/
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }
    
    .rtl table {
        text-align: right;
    }
    
    .rtl table tr td:nth-child(2) {
        text-align: left;
    }
    </style>
       
    <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
   
</head>


<body>
   
   

<%  



int loid=0;
String Trans_id="xxxx";
String Trans_date=null,trans_time=null;
Double ttotal=0.0;
String uname=null,uphone=null,loemail=null;
String email=request.getSession().getAttribute("email").toString();
session.setMaxInactiveInterval(5*60);
connection con= new connection();
try{
 	
	
	PreparedStatement ps1=con.getPreparedstatement("select uname,loid,uphone,loemail from registration inner join Login on registration.loidfk=Login.loid where loemail =?");	 
ps1.setString(1,email);
ResultSet rst=ps1.executeQuery();
while(rst.next()){
	uname=rst.getString(1);
	loid=rst.getInt(2);
	uphone=rst.getString(3);
	loemail=rst.getString(4);
}
PreparedStatement ps2=con.getPreparedstatement("select tdate,ttime,tamount,tid from Transactiontable inner join Custpayment on Transactiontable.cpidfk=Custpayment.id where Custpayment.loidfk =?");	 
ps2.setInt(1,loid);
ResultSet rst1=ps2.executeQuery();
while(rst1.next()){
	Trans_date=rst1.getString(1);
	trans_time=rst1.getString(2);
	ttotal=rst1.getDouble(3);
	Trans_id=Trans_id+rst1.getInt(4);
}}

catch(Exception e){
	out.print(e);}


%>


   
   
   
    

    <form class="form" style="max-width: none; width: 1005px;">
            <div class="invoice-box"  >
                    
                     <center>  <h1>Electro</h1></center>
                     <center>  <h5>Email id: Electro@gmail.com</h5></center>
                     <center>  <h5>contact number:9947336026</h5></center>
                                <br>
                                
                                Invoice #: <%=Trans_id%><br>
                                Created: <%=Trans_date%><br>
                                Due: <%=Trans_date%>
<table cellpadding="0" cellspacing="0">
                        <tr >
                            <td colspan="3">
                                <table>
                                    <tr>
                                            <td>
                                                   
                                            </td>
                                        
                                        
                                        
                                        <td>
                                                
                                                <%=uname%><br>
                                                
                                             <%=uphone%><br>
                                              <%=loemail%>
                                        </td>
                                    </tr>
                                </table>
                                <br><br><br>
                            </td>
                        </tr>
                        
                        
                        <tr class="heading">
                            <td>
                                Payment Method
                            </td>
                            <td></td>
                            <td>
                                paid amount
                            </td>
                        </tr>
                        
                        <tr class="item">
                            <td>
                               Credit card
                            </td>
                            <td></td>
                            
                            <td>
                               <%=ttotal%>
                            </td>
                        </tr>
                        
                        
                        <tr class="total">
                            <td></td>
                            <td></td>
                            
                            <td>
                              <br> Total:Rs <%=ttotal%>
                            </td>
                        </tr>
                    </table>
                
                    
                
                </div>
</form>
<center><input type="button" id="create_pdf" value="Generate PDF"></center>
</body>


</html>
<script>
    (function () {
        var
         form = $('.form'),
         cache_width = form.width(),
         a4 = [595.28, 841.89]; // for a4 size paper width and height

        $('#create_pdf').on('click', function () {
            $('body').scrollTop(0);
            createPDF();
        });
        //create pdf
        function createPDF() {
            getCanvas().then(function (canvas) {
                var
                 img = canvas.toDataURL("image/png"),
                 doc = new jsPDF({
                     unit: 'px',
                     format: 'a4'
                 });
                doc.addImage(img, 'JPEG', 20, 20);
                doc.save('invoice.pdf');
                form.width(cache_width);
            });
        }

        // create canvas object
        function getCanvas() {
            form.width((a4[0] * 1.33333) - 80).css('max-width', 'none');
            return html2canvas(form, {
                imageTimeout: 2000,
                removeContainer: true
            });
        }

    }());
</script>
<script>
    /*
 * jQuery helper plugin for examples and tests
 */
    (function ($) {
        $.fn.html2canvas = function (options) {
            var date = new Date(),
            $message = null,
            timeoutTimer = false,
            timer = date.getTime();
            html2canvas.logging = options && options.logging;
            html2canvas.Preload(this[0], $.extend({
                complete: function (images) {
                    var queue = html2canvas.Parse(this[0], images, options),
                    $canvas = $(html2canvas.Renderer(queue, options)),
                    finishTime = new Date();

                    $canvas.css({ position: 'absolute', left: 0, top: 0 }).appendTo(document.body);
                    $canvas.siblings().toggle();

                    $(window).click(function () {
                        if (!$canvas.is(':visible')) {
                            $canvas.toggle().siblings().toggle();
                            throwMessage("Canvas Render visible");
                        } else {
                            $canvas.siblings().toggle();
                            $canvas.toggle();
                            throwMessage("Canvas Render hidden");
                        }
                    });
                    throwMessage('Screenshot created in ' + ((finishTime.getTime() - timer) / 1000) + " seconds<br />", 4000);
                }
            }, options));

            function throwMessage(msg, duration) {
                window.clearTimeout(timeoutTimer);
                timeoutTimer = window.setTimeout(function () {
                    $message.fadeOut(function () {
                        $message.remove();
                    });
                }, duration || 2000);
                if ($message)
                    $message.remove();
                $message = $('<div ></div>').html(msg).css({
                    margin: 0,
                    padding: 10,
                    background: "#000",
                    opacity: 0.7,
                    position: "fixed",
                    top: 10,
                    right: 10,
                    fontFamily: 'Tahoma',
                    color: '#fff',
                    fontSize: 12,
                    borderRadius: 12,
                    width: 'auto',
                    height: 'auto',
                    textAlign: 'center',
                    textDecoration: 'none'
                }).hide().fadeIn().appendTo('body');
            }
        };
    })(jQuery);

</script>
