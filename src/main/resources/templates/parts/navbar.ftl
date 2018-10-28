<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Twiter</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li>
                <a class="nav-link" href="/main">Messages</a>
            </li>
            <#if <#--name == "unknown"-->!user??>
            </#if>
            <#if isAdmin>
            <li>
                <a class="nav-link" href="/user">User List</a>
            </li>
            </#if>
            <#if name != "guest">
            <li>
                <a class="nav-link" href="/user/profile">Profile</a>
            </li>
            <li>
                <a class="nav-link" href="/user-messages/${currentUserId}">My messages</a>
            </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3">${name}</div>
        <#if name != "guest">
        <@l.logout></@l.logout>
        </#if>
        <#if name == "guest">
            <a href="/login"><button class="btn btn-primary">Login</button></a>
        </#if>
    </div>
</nav>