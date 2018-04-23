<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .container {
            text-align: center;
            padding: 5px 0; 
            font-size: 13pt;
        }
        .anchor {
            padding: 0 10px; 
        }
        .active {
            color: red !important;
        }
    </style>
    <script type="text/javascript">
        function MoveToPage(symbol) {
            grid.PerformCallback(symbol);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" 
            KeyFieldName="CustomerID" ClientInstanceName="grid" OnCustomCallback="Grid_CustomCallback" Width="900">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CustomerID" />
                <dx:GridViewDataTextColumn FieldName="CompanyName" />
                <dx:GridViewDataTextColumn FieldName="Address"  />
                <dx:GridViewDataTextColumn FieldName="City" />
                <dx:GridViewDataTextColumn FieldName="Region" />
                <dx:GridViewDataTextColumn FieldName="PostalCode" />
                <dx:GridViewDataTextColumn FieldName="Country" />
                <dx:GridViewDataTextColumn FieldName="Phone" />
                <dx:GridViewDataTextColumn FieldName="Fax" />
            </Columns>
            <SettingsPager AlwaysShowPager="true" />
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Customers]" />
    </form>
</body>
</html>
