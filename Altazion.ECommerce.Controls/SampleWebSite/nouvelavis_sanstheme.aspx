<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nouvelavis_sanstheme.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.nouvelavis_sanstheme" %>

<%@ Register src="Controls/AvisSaisie.ascx" tagname="AvisSaisie" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>

<head>
    <style type="text/css">
    body, P, TD, SPAN
    {
    	background:white none;
    	font-family:Arial;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:AvisSaisie ID="AvisSaisie1" runat="server" />
    
    </div>
    </form>
</body>
</html>
