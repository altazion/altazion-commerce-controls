<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MessageAuClientControl.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.MessageAuClientControl" %>
<div class="MessagesAuClient">
    <ecom:MessageAuClientDataList runat="server" id="lstMessage" RepeatLayout="Flow" >
        <ItemTemplate>
            <div><ecom:MessageAuClientLink runat="server" id="lnkMessage" /></div>
        </ItemTemplate>
    </ecom:MessageAuClientDataList>
</div>
