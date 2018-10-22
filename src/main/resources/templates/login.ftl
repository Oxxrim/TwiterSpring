<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
   <#-- <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        Invalid username or password!
    </div>
    </#if>-->
    <div id="error"></div>
    <script>
        var link = window.location.href;
        var error = '';
        if (link.includes("error")){
            error = 'Invalid username or password!';
            document.getElementById("error").className += "alert alert-danger";
        }
        document.getElementById("error").innerHTML = error;
    </script>
    <#if message??>
    <div class="alert alert-${messageType}" role="alert">
        ${message}
    </div>
    </#if>

    <@l.login "/login" false/>
</@c.page>