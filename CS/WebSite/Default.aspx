<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title></title>
    <style type="text/css">
        .container {
            display: flex;
            flex-wrap: wrap;
            text-align: center;
            padding: 5px 0;
            font-size: 13pt;
        }

        .anchor {
            padding: 0 10px;
        }

        .active {
            color: navy !important;
            font-weight:600;
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
        <div>
            <dx:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" Width="100%" OnCustomCallback="grid_CustomCallback"
                DataSourceID="AccessDataSource1" KeyFieldName="ProductID" AutoGenerateColumns="False">
                <SettingsPager AlwaysShowPager="true"  Position="Top"/>
                <SettingsAdaptivity AdaptivityMode="HideDataCells"></SettingsAdaptivity>
                <Columns>
                    <dx:GridViewDataColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="ProductName" VisibleIndex="2">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="UnitPrice" VisibleIndex="3">
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn FieldName="UnitsOnOrder" VisibleIndex="4">
                    </dx:GridViewDataColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsOnOrder] FROM [Products]"
                InsertCommand="INSERT INTO [Products] ([ProductName], [UnitPrice], [UnitsOnOrder]) VALUES (?, ?, ?)"
                UpdateCommand="UPDATE [Products] SET [ProductName] = ?, [UnitPrice] = ?, [UnitsOnOrder] = ? WHERE [ProductID] = ?"
                DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="UnitsOnOrder" Type="Int16" />
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>

