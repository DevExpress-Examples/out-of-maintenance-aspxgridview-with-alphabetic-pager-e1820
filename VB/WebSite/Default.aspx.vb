Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Private Const sessionKey As String = "CE6907BD-E867-4cbf-97E2-F1EB702F433"
	Public Property ActivePageSymbol() As String
		Get
			If Session(sessionKey) Is Nothing Then
				Session(sessionKey) = "A"
			End If
			Return CStr(Session(sessionKey))
		End Get
		Set(ByVal value As String)
			Session(sessionKey) = value
		End Set
	End Property
	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		If Not IsPostBack Then
			grid.PageIndex = -1 ' to show all visible records
		End If
		RefreshGridViewPager()
	End Sub
	Private Sub RefreshGridViewPager()
		grid.Templates.PagerBar = New MyPagerBarTemplate(ActivePageSymbol)
		grid.FilterExpression = String.Format("StartsWith([ProductName], '{0}')", ActivePageSymbol)
	End Sub

	Public Class MyPagerBarTemplate
		Implements ITemplate

'INSTANT VB NOTE: The field activePageSymbol was renamed since Visual Basic does not allow fields to have the same name as other class members:
		Private activePageSymbol_Conflict As String

		Public Sub New(ByVal activePageSymbol As String)
			Me.activePageSymbol_Conflict = activePageSymbol
		End Sub

		Public ReadOnly Property ActivePageSymbol() As String
			Get
				Return activePageSymbol_Conflict
			End Get
		End Property

		Public Sub InstantiateIn(ByVal container As Control)
			Dim alphabet As New List(Of String)(27)
			Dim startCharIndex As Integer = Convert.ToInt32("A"c)
			Dim endChartIndex As Integer = Convert.ToInt32("Z"c)
			For i As Integer = startCharIndex To endChartIndex
				alphabet.Add(Convert.ToChar(i).ToString())
			Next i

			Dim div As New WebControl(HtmlTextWriterTag.Div)
			container.Controls.Add(div)
			div.Attributes("class") = "container"


			For Each item As String In alphabet
				Dim anchor As New HtmlAnchor()
				div.Controls.Add(anchor)

				anchor.HRef = String.Format("javascript:MoveToPage('{0}')", item)
				anchor.InnerText = item
				anchor.Attributes("class") = "anchor"
				If item = ActivePageSymbol Then
					anchor.Attributes("class") &= " active"
				End If
			Next item
		End Sub
	End Class

	Protected Sub grid_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
		ActivePageSymbol = e.Parameters
		RefreshGridViewPager()
	End Sub
End Class