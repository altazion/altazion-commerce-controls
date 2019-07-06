<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintProduct.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.PrintProduct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Print">
        <table style="width: 100%; height: 100%; background-color: White;">
            <tr>
                <td>
                    <ecom:ThemablePanelControl runat="server" SkinID="ProductPagePanel" ID="ProductPagePanel">
                        <Content>
                            <ecom:ProduitEnFiche ID="ProduitEnFiche1" runat="server" />
                        </Content>
                    </ecom:ThemablePanelControl>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
