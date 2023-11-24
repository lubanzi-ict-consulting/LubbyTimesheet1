﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timesheet.aspx.cs" Inherits="MVPSystem.Timesheet1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <title>Timesheet List</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script>
        function redirectToDetails(projectName, employeeName) {
            // Handle redirection to details page using JavaScript
            var url = "DetailsPage.aspx?ProjectName=" + projectName + "&EmployeeName=" + employeeName;
            window.location.href = url;
        }
    </script>

    <!-- Styling for the page -->
    <style>
        body {
            font-family: 'Lato', sans-serif;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            position: fixed;
            width: 220px;
            height: 100%;
            background-color: #2c3e50;
            color: #ecf0f1;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            gap: 20px;
            padding-top: 20px;
        }

            .sidebar a {
                padding: 10px 25px;
                text-decoration: none;
                font-size: 16px;
                color: #ecf0f1;
                display: block;
                transition: background-color 0.3s;
                border-radius: 5px;
                width: 100%;
                text-align: left;
            }

                .sidebar a:hover {
                    background-color: #3498db;
                }

        .content {
            margin-left: 220px;
            padding: 20px;
        }

        @media (max-width: 768px) {
            .sidebar {
                display: none;
            }

            .content {
                margin-left: 0;
            }
        }

         .navbar {
     background-color: #11181f;
     display: flex;
     justify-content: space-between;
     align-items: center;
     padding: 10px 20px;
        }

        .navbar-brand {
     color: #ecf0f1;
     margin-right: auto;
        }

        .hamburger-icon {
     font-size: 20px;
     cursor: pointer;
     color: #ecf0f1;
     margin-left: 10px;

        }

        /* Adjusted card styles */
        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ecf0f1;
            padding: 20px;
        }

        .card-header {
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            margin-bottom: 20px;
            background-color: dimgray;
            color: white;
        }

        .btn-timesheet {
            margin-top: 10px;
        }

        .table-container {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <!-- Top navigation bar -->
    <div class="navbar">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <span class="navbar-toggler-icon hamburger-icon" id="toggleSidebar">&#9776;</span>
    <a class="navbar-brand" href="#">LUBANZI</a>
</div>

    <!-- Sidebar navigation -->
    <div class="sidebar">
        <!-- Sidebar links -->
        <a href="Dashboard.aspx">
            <i class="fas fa-home"></i>Dashboard
        </a>
        <a href="Project.aspx">
            <i class="fas fa-briefcase"></i>Project
        </a>
        <a href="Employee.aspx">
            <i class="fas fa-users"></i>Employee
        </a>
        <a href="Timesheet.aspx">
            <i class="fas fa-keyboard"></i>Timesheet
        </a>
        <a href="Login.aspx">
            <i class="fas fa-power-off"></i>Logout
        </a>
    </div>

    <!-- Main content area -->
    <div class="content">
        <form id="form2" runat="server">
            <!-- Bootstrap card container -->
            <div class="card">
                <div class="card-header">
                    <h1 class="card-title">Timesheet List</h1>
                    <!-- Button in the card header -->
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <asp:Button ID="btnTimesheet" runat="server" Text="New Timesheet" CssClass="btn btn-primary btn-timesheet" OnClick="btnTimesheet_Click" />
                    </div>
                </div>
                <div class="card-body">
                    <!-- Data table container -->
                    <div class="container table-container">
                        <!-- Move SqlDataSource1 inside the form -->
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [ProjectName], [Task], [StartDate], [EndDate], [EmployeeName] FROM [CaptureTimesheet]"></asp:SqlDataSource>

                        <!-- GridView for displaying timesheet data -->
                        <asp:GridView ID="gvCaptureTimesheet" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSource1" CssClass="table table-bordered">
                            <Columns>
                                <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" SortExpression="ProjectName" />
                                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                                <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" DataFormatString="{0:dd MMMM yyyy}" />
                                <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" DataFormatString="{0:dd MMMM yyyy}" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <!-- Use the eye icon for the "View" button -->
                                      <a href='<%# "ViewTimesheet.aspx?ProjectName=" + Eval("ProjectName") + "&Employee=" + Eval("EmployeeName") + "&Task=" + Eval("Task") + "&StartDate=" + Eval("StartDate") + "&EndDate=" + Eval("EndDate") %>' class="btnView">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Toggle sidebar script -->
    <script>
        $(document).ready(function () {
            $("#toggleSidebar").click(function () {
                $(".sidebar").toggle();
            });
        });
    </script>
</body>
</html>
