<%@ Language=VBScript %>
 
<%
Response.Buffer = true
Response.CacheControl = "Public"
Response.Expires = 30
'  InetPub\wwwroot\Manufacturing\ITLI.asp
'
'       Date      Case#    Rep   Status   Summary
'     --------   -------   ---   ------   -------
'      05-07-04            MCL   OPEN     Create login page for PPAP team Assignment form
%>
<!-- #include virtual = "/_private/ADOVBS.inc" -->
 
<HTML>
<HEAD>
   <link rel="Stylesheet" href="_private/mainstyles.css" />
    <link rel="stylesheet" type="text/css" href="css/start/jquery-ui-1.10.4.custom.css" />
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
 
    <title>PPAP LOGIN</title>
    <style>
    html, body {
           margin: 8px;                  /* Remove body margin/padding */
           padding: 0;
           font-size: 75%;
    }
    </style>
</HEAD>
 
 
 
 
<script type="text/javascript">
     
   
       function Validate() {
        //check if ID field is populated -- if not send error message in either English or Portuguese (based on user's HTTP_ACCEPT_LANGUAGE setting)
        if (document.getElementById("Tech").value == "") {
            if (document.getElementById("userlang").value == "pt") {
                alert("Por favor indique ID do usuário");
                $("#Tech").focus();
            }
            else {tchonkey
                alert("Please enter User ID");
                $("#Tech").focus();
            }
        }
            //check if password field is populated -- if not send error message in either English or Portuguese
        else if (document.getElementById("Pass").value == "") {
            if (document.getElementById("userlang").value == "pt") {
                alert("Por favor, insira a senha");
                $("#Pass").focus();
            }
        else {
                alert("Please enter Password");
                $("#Pass").focus();
        };
        }
            //both ID and password field are populated, call ProdLogin1.asp login validation program
        else {
              $("#Job").attr("action", "PPAPMain.asp?tech=" + document.getElementById("Tech").value);
            document.getElementById("Job").submit();
        };
    };
 
    // Check to see if the Enter Key is pressed. If Enter Key is pressed, then validate and submit the form.
    function checkEnter(event) {
            console.log('Echeck Enter'+event.which);
            if( event.which == 13) {
                  Validate();
            }
       }
 
 
</script>
 
 
<BODY style="background-color:powderblue;">
<form method="post" name="Job" id="Job">
    <input type="hidden" name="userlang" id="userlang" value="<%=Left(Request.ServerVariables("HTTP_ACCEPT_LANGUAGE"),2)%>" />
    <%If Left(Request.ServerVariables("HTTP_ACCEPT_LANGUAGE"),2) <> "en" Then %>
    <div id='MicrosoftTranslatorWidget' class='Dark' style='color:white;background-color:#555555'></div>
        <script type='text/javascript'>
            setTimeout(function () {
                {
                    var s = document.createElement('script');
                    s.type = 'text/javascript';
                    s.charset = 'UTF-8';
                    s.src = ((location && location.href && location.href.indexOf('https') == 0) ? 'https://ssl.microsofttranslator.com' : 'http://www.microsofttranslator.com') + '/ajax/v3/WidgetV3.ashx?siteData=ueOIGRSKkd965FeEGM5JtQ**&ctf=False&ui=False&settings=Auto&from=en&languages=cs,da,de,el,eo,es,fr,ga,it,nl,pt,ru';
                    var p = document.getElementsByTagName('head')[0] || document.documentElement; p.insertBefore(s, p.firstChild);
                }
            }, 0);
    </script>
    <%End If%>      
       <table class=TextItem width="100%">
              <tr>
                     <td colspan=4 align='center'><b>Please Log In</b></td>
              </tr>
              <tr><td colspan=4></td></tr>
       </table>
       <table class=TextItem width="100%" ID="Table1">
              <tr>
                     <hr>
              </tr>
              <tr>
                     <td align=left width = "33%">User Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='Tech' id='Tech' size='20' autofocus></td>
              </tr>
              <tr>
                     <td align = "left">Password:&nbsp;&nbsp;&nbsp;<input type='password' onkeydown="checkEnter(event)" name='Pass' id='Pass' size='20'></td>
                     <td align=left width = "33%"><input type="button" value="Log In" onClick="Validate()" id="button1" name="button1"></td>
              </tr>
       </table>
       <hr>
</FORM>
</BODY>
</HTML>      