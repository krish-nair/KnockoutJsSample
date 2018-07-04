<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo2.aspx.cs" Inherits="KnockoutJsSample.Demo2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Understanding Observable Array of Knockout</title>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/jquery.tmpl.js"></script>
    <script src="Scripts/knockout-3.4.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <p>Product Name: <input type="text" data-bind="value: productName" /></p>
                <p>Price: <input type="text" data-bind="value: price" /></p>
                <button data-bind="click: addProduct, enable: products().length < 5">Add Product</button>
            </div>
            <%--<div data-bind="template : 'productsTemplate'"></div>
            <script type="text/html" id="productsTemplate">
                <ul>
                    {{each(index, product) products}}
                    <li><label>Product ${product.pname} - ${product.price} added at ${new Date}</label></li>
                    {{/each}}
                </ul>
            </script>--%>
            <label>Total (<span data-bind="text: products().length"></span>) Products</label>
            <ul data-bind="template: {name: 'productsTemplate', foreach: products}"></ul>
            <script type="text/html" id="productsTemplate">
                <li><label>Product ${$data.pname} - ${$data.price} added at ${new Date}</label>
                    <button data-bind="click: remove">Remove</button>
                </li>
            </script>
        </div>
    </form>
    <script type="text/javascript">
        function Product(pname, price) {
            return {
                pname: ko.observable(pname),
                price: ko.observable(price),
                remove: function () {
                    vm.products.remove(this);
                }
            };
        }
        var vm = {
            productName: ko.observable("New Product"),
            price: ko.observable(0),
            products: ko.observableArray([new Product("Laptop", 32000), new Product("Camera", 26000)]),
            addProduct: function () {
                vm.products.push(new Product(this.productName(), this.price()));
            }
        };
        ko.applyBindings(vm);
    </script>
</body>
</html>
