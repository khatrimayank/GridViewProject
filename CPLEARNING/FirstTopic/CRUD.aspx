<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="CPLEARNING.FirstTopic.CRUD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-8 col-md-offset-2">
            <!-- Input fields for adding a new record -->
            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label>First Name</label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox CssClass="form-control" ID="txtfname" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label>Last Name</label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox CssClass="form-control" ID="txtlname" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label>Age</label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox CssClass="form-control" ID="txtage" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2">
                        <label>Salary</label>
                    </div>
                    <div class="col-md-10">
                        <asp:TextBox CssClass="form-control" ID="txtsalary" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-2 col-md-offset-1">
                        <asp:Button runat="server" ID="btnsubmit"
                            CssClass="btn btn-block btn-success"
                            Text="Submit" OnClick="btnsubmit_Click" />
                    </div>

                    <div class="col-md-2">
                        <asp:Button runat="server" ID="btnclear"
                            CssClass="btn btn-block btn-danger"
                            Text="Clear" OnClick="btnclear_Click" />
                    </div>

                </div>
            </div>

            <br />

            <asp:Label runat="server" ID="lblmsg"></asp:Label>

        </div>

        <div class="col-md-8 col-md-offset-2">
            <asp:GridView ID="empgrid" runat="server" CssClass="table"
                OnRowDeleting="empgrid_RowDeleting"
                OnRowEditing="empgrid_RowEditing"
                OnRowUpdating="empgrid_RowUpdating"
                OnRowCancelingEdit="empgrid_RowCancelingEdit"
                DataKeyNames="Id"
                AutoGenerateColumns="false">
                <Columns>

                    <asp:BoundField HeaderText="Employee Id" DataField="Id"  ReadOnly="true"/>

                    <asp:TemplateField HeaderText="First Name">

                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtfname" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                        </EditItemTemplate>

                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Last Name">

                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtlname" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Age">

                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtage" Text='<%# Bind("Age") %>'></asp:TextBox>
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Salary">

                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Salary") %>'></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtsalary" Text='<%# Bind("Salary") %>'></asp:TextBox>
                        </EditItemTemplate>

                    </asp:TemplateField>

                    <asp:CommandField ShowDeleteButton="true"
                        ControlStyle-CssClass="btn btn-danger" HeaderText="Remove Record" />

                    <asp:CommandField ShowEditButton="true"
                        ControlStyle-CssClass="btn btn-primary" HeaderText="Edit Record" />

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
