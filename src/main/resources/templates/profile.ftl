<#import "parts/common.ftl" as c>

<@c.page>
<h5>${username}</h5>
    ${message?if_exists}
    <form method="post">
        <div class="form-group-row">
            <label class="col-sm-2 col-form-label"> Password: </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control mb-2" placeholder="password"/>
            </div>
        </div>
        <div class="form-group-row">
            <label class="col-sm-2 col-form-label"> Email: </label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control mb-2" placeholder="user@gmail.com" value="${email!''}"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <br>
        <button type="submit" class="btn btn-primary mt-2">Save</button>
    </form>
</@c.page>