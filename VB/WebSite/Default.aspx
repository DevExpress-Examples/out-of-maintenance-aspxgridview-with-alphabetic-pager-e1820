<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2" Namespace="DevExpress.Web.ASPxEditors"
	TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.2" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
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
		<dxwgv:ASPxGridView ID="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" 
			KeyFieldName="CustomerID" ClientInstanceName="grid" OnCustomCallback="Grid_CustomCallback" Width="900">
			<Columns>
				<dxwgv:GridViewDataTextColumn FieldName="CustomerID" VisibleIndex="0" />
				<dxwgv:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="1" />
				<dxwgv:GridViewDataTextColumn FieldName="Address" VisibleIndex="2" />
				<dxwgv:GridViewDataTextColumn FieldName="City" VisibleIndex="3" />
				<dxwgv:GridViewDataTextColumn FieldName="Region" VisibleIndex="4" />
				<dxwgv:GridViewDataTextColumn FieldName="PostalCode" VisibleIndex="5" />
				<dxwgv:GridViewDataTextColumn FieldName="Country" VisibleIndex="6" />
				<dxwgv:GridViewDataTextColumn FieldName="Phone" VisibleIndex="7" />
				<dxwgv:GridViewDataTextColumn FieldName="Fax" VisibleIndex="8" />
			</Columns>
			<SettingsPager AlwaysShowPager="true" />
		</dxwgv:ASPxGridView>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
			SelectCommand="SELECT * FROM [Customers]" />
	</form>
</body>
</html>