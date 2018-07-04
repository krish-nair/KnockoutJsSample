<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo1.aspx.cs" Inherits="KnockoutJsSample.Demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My First Knockout Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>First Name: <span data-bind="text: firstName" /></p>
            <p>Last Name: <span data-bind="text : lastName" /></p>
        </div>
        <hr />
        <div>
            <p>First Name: <asp:TextBox ID="txtUser" runat="server" data-bind="value: firstName, valueUpdate: 'keyup'" /></p>
            <p>Last Name: <asp:TextBox ID="txtPassword" runat="server" data-bind="value: lastName" /></p>
        </div>
        <hr />
        <div>
            <p>Last Name: <span data-bind="text:fullName" /></p>
        </div>
    </form>
    <script src="Scripts/knockout-3.4.2.js"></script>
    <script type="text/javascript">
        var vm = {
            //firstName: "Krish",
            //lastName: "Nair"
            firstName: ko.observable("Krish"),
            lastName: ko.observable("Nair")
        };

        vm.fullName = ko.dependentObservable(function () {
            return vm.firstName() + " " + vm.lastName()
        });
        vm.firstName.subscribe(function (val) {
            console.log("First name updated as " + val)
        });

        ko.applyBindings(vm);
    </script>
</body>
</html>
