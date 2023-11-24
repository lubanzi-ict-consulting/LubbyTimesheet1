<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MVPSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Login form</title>
    <link href="assets/css/Login.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card mx-auto text-center">
                    <img src="Capture2.PNG" class="card-img-top img-fluid mb-4" alt="Card image" style="width: 100px; height: auto; display: block; margin: 0 auto;">
                    <div class="card-body">
                        <h3 class="card-title">Sign in</h3>
                        <asp:Label ID="Label1" runat="server" Text="Sign in to continue" CssClass="d-block"></asp:Label>
                        <form id="form1" runat="server" class="needs-validation text-center" novalidate>

                            <!-- Email Section -->
                            <div class="form-group text-left">
                                <label for="txtEmail" style="font-size: 14px;">Email <span style="color: red">*</span></label>
                                <div class="input-group" style="width: 70%; margin: 0 auto;">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" required />
                                    <div class="input-group-append">
                                    </div>
                                </div>
                                <div class="invalid-feedback">
                                    Please enter a valid email.
                                </div>
                                <i id="toggleEmail" class="fa fa-envelope"></i>
                            </div>

                            <!-- Password Section -->
                            <div class="form-group text-left">
                                <label for="txtPassword" style="font-size: 14px;">Password <span style="color: red">*</span></label>
                                <div class="input-group" style="width: 70%; margin: 0 auto;">
                                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" required />
                                    <div class="input-group-append">
                                    </div>
                                </div>
                            </div>

                            <!-- Remember Me and Forgot Password Section -->
                            <div class="form-group">
                                <div class="row justify-content-center">
                                    <div class="col-6">
                                        <div class="form-check">
                                            <input class="form-check-input" id="chkRememberMe" type="checkbox" />
                                            <label class="form-check-label" for="chkRememberMe">Remember me</label>
                                        </div>
                                    </div>
                                    <div class="col-6 text-right">
                                        <asp:HyperLink ID="lnkForgotPass" href="ForgotPassword.aspx" runat="server" Font-Size="Small">Forgot password?</asp:HyperLink>
                                    </div>
                                </div>
                            </div>

                            <!-- Invalid Feedback for Password -->
                            <div class="invalid-feedback">
                                Please enter your password.
                            </div>

                            <!-- Recaptcha Section -->
                            <div class="form-group">
                                <div class="g-recaptcha" data-sitekey="6LeyxxopAAAAAAJfhC6giJ3WRr5VV1n9zCrSpkyl"></div>
                            </div>

                            <!-- Submit Button and Create Account Section -->
                            <asp:Button runat="server" ID="Button1" Text="Sign in" OnClick="BtnLogin_Click" CssClass="btn btn-primary" />
                            <div class="text-center">
                                <p>
                                    <asp:HyperLink ID="lnkRegister" href="Registration.aspx" runat="server">Create an Account</asp:HyperLink>
                                </p>
                            </div>

                            <!-- Error Message Section -->
                            <asp:Label ID="txtErrorMessage" runat="server" Text="" ForeColor="red"></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="assets/js/Login.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/umd/popper.min.js"></script>
    <script src="Scripts/jquery-3.7.1.slim.min.js"></script>

</body>
</html>
