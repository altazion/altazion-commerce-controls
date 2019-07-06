<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Waiting.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Waiting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <ecom:ThemeCssLink ID="ThemeCssLink1" runat="server" />
    <ecom:XmlRpcMeta ID="XmlRpcMeta1" runat="server" />
</head>
<body class="offline">
    <form id="form1" runat="server">
    <div id="FullContent">
        <div id="FullContentSecondLayer">
            <div id="FullContentThirdLayer">
                <div id="PageMainZone">
                    <div id="PageMiddle">
                        <ecom:ThemablePanelControl runat="server" ID="themeWaiting" SkinID="WaitingContent">
                            <Content>
                                <h1>
                                    <ecom:SiteNom runat="server" /></h1>
                                <h2>
                                    Site en maintenance</h2>
                                <p>
                                    Le site sera de retour dans quelques instants, après quelques travaux de maintenance.
                                    Merci de votre patience.</p>
                            </Content>
                        </ecom:ThemablePanelControl>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
