<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<script>
    var link = window.location.href;
    var error = '';
    if (link.includes('error')){
        error = 'Invalid username or password';
    }
    document.getElementById('error').innerHTML = error;
</script>
<div id="error"></div>
    ${message?if_exists}
<@l.login "/login" false/>
</@c.page>