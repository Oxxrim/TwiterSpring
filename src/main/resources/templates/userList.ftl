<#import "parts/common.ftl" as c>

<@c.page>
<h3>List of users</h3>
<table class="table mt-2">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Role</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
<#list users as user>
<tr>
    <td scope="row">${user.username}</td>
    <td><#list user.roles as role>${role}<#sep>, </#list></td>
    <td><a href="/user/${user.id}">edit</a></td>
</tr>
</#list>
    </tbody>
</table>
</@c.page>