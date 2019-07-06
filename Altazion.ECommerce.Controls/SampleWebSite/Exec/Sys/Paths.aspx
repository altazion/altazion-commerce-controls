<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paths.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Sys.Paths" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul>
        <li>Chemin de la solution : 
            <asp:Label ID="lblBinPath" runat="server"></asp:Label>
                </li>
        <li>Chemin d'extensibilité : 
            <asp:Label ID="lblExtPath" runat="server"></asp:Label>
                </li>
        </ul>
    </div>
    </form>
</body>
</html>
