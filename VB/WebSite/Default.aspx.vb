Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Drawing
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        ASPxDataView1.DataBind()
    End Sub
    Private Function IsSuitableItem(ByVal dataItem As Object) As Boolean
        Dim searchText As String = searchTextBox.Text.ToLower()
        If dataItem IsNot Nothing AndAlso (Not String.IsNullOrEmpty(searchText)) Then
            Dim valueText As String = DataBinder.Eval(dataItem, "ProductName").ToString().ToLower()
            Return (valueText.Contains(searchText))
        End If
        Return False
    End Function
    Public Function SetPanelColor(ByVal dataItem As Object) As Color
        Return If(IsSuitableItem(dataItem), Color.LightGreen, Color.Empty)
    End Function
    Protected Sub ASPxDataView1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
        Dim selectResult As List(Of DataRowView) = Products.Select(DataSourceSelectArguments.Empty).Cast(Of DataRowView)().ToList()
        For i As Integer = 0 To selectResult.Count - 1
            If IsSuitableItem(selectResult(i)) Then
                ASPxDataView1.PageIndex = i / ASPxDataView1.PageCount
                Return
            End If
        Next i
    End Sub
End Class
