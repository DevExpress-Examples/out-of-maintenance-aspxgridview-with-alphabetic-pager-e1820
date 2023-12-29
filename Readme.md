<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView with alphabetic pager


<p>This example illustrates how to create a custom alphabetic pager. <br />
In fact, Alphabetic pager is filtering by a column.<br />
In this example we create a custom pager template, which contains anchors with alphabetic letters. After a click on an anchor the ASPxClientGridView.PerformCallback function is called with a parameter. On the server side, a new custom pager template is created in the ASPxGridView.CustomCallback event handler, and filtering by passed parameters takes place.</p>

<br/>


