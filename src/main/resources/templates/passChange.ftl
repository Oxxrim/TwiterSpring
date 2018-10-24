<#import "parts/common.ftl" as c>

<@c.page>
    <form method="post">
        <div class="form-group-row">
            <label class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control mb-2 ${(emailError??)?string('is-invalid', '')}"
                       placeholder="user@gmail.com"/>
                 <#if emailError??>
                     <div class="invalid-feedback">
                         ${emailError}
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
        <div class="form-group-row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-6">
                <input type="password" name="password2" class="form-control mb-2 ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Repeat password"/>
                <#if password2Error??>
                     <div class="invalid-feedback">
                         ${password2Error}
                     </div>
                </#if>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <br>
        <button type="submit" class="btn btn-primary mt-2">Change</button>
    </form>
</@c.page>