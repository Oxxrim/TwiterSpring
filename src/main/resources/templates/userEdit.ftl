<#import "parts/common.ftl" as c>

<@c.page>
User editor

<form action="/user" method = "post">
    <input class="form-control" type="text" name="username" value="${user.username}" placeholder="username">
    <#list roles as role>
    <div class="form-check">
        <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}/>${role}</label>
    </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId"/>
    <input type="hidden" value="${_csrf.token}" name="_csrf"/>
    <button type="submit" class="btn btn-primary">Save</button>
</form>
</@c.page>