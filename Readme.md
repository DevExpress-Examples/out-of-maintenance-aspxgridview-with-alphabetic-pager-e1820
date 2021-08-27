<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128536677/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E1820)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxGridView with alphabetic pager
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e1820/)**
<!-- run online end -->


<p>This example illustrates how to create a custom alphabetic pager. <br />
In fact, Alphabetic pager is filtering by a column.<br />
In this example we create a custom pager template, which contains anchors with alphabetic letters. After a click on an anchor the ASPxClientGridView.PerformCallback function is called with a parameter. On the server side, a new custom pager template is created in the ASPxGridView.CustomCallback event handler, and filtering by passed parameters takes place.</p>

<br/>


