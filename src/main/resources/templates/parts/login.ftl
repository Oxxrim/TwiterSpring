<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group-row">
            <label class="col-sm-2 col-form-label"> User Name : </label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="username" value="<#if user??>${user.username}</#if>"/>
                <#if usernameError??>
                     <div class="invalid-feedback">
                         ${usernameError}
                     </div>
                </#if>
            </div>
        </div>
        <div class="form-group-row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control mb-2 ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="password"/>
                 <#if passwordError??>
                     <div class="invalid-feedback">
                         ${passwordError}
                     </div>
                 </#if>
            </div>
        </div>
    <#if isRegisterForm>
    <div class="form-group-row">
        <label class="col-sm-2 col-form-label"> Password: </label>
        <div class="col-sm-6">
            <input type="password" name="password2" class="form-control mb-2 ${(password2Error??)?string('is-invalid', '')}"
                   placeholder="Retype password"/>
                 <#if password2Error??>
                     <div class="invalid-feedback">
                         ${password2Error}
                     </div>
                 </#if>
        </div>
    </div>
        <div class="form-group-row">
            <label class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control mb-2 ${(emailError??)?string('is-invalid', '')}"
                       placeholder="user@gmail.com" value="<#if user??>${user.email}</#if>"/>
                 <#if emailError??>
                     <div class="invalid-feedback">
                         ${emailError}
                     </div>
                 </#if>
            </div>
        </div>
    <div class="col-sm-6">
        <div class="g-recaptcha" data-sitekey="6Lfp-HQUAAAAACCi-l6hNYtOSEwLdfS44MzCA2D8"></div>
        <#if captchaError??>
            <div class="alert alert-danger" role="alert">
                ${captchaError}
            </div>
        </#if>

    </div>

    </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm>
            <a href="/registration" class="badge badge-info">Add new user</a>
            <a href="/passChange" class="badge badge-info">Forgot password?</a>
        </#if>
        <br>
        <button type="submit" class="btn btn-primary mt-2"><#if isRegisterForm>Create<#else>Sign in</#if></button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Sign Out</button>
    </form>
</#macro>