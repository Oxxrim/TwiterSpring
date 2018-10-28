<a id="message" class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">

</a>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text}</#if>" type="text" name="text" placeholder="Введите сообщение" />
                    <#if textError??>
                     <div class="invalid-feedback">
                         ${textError}
                     </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input class="form-control ${(tagError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.tag}</#if>" type="text" name="tag" placeholder="Тэг" />
                    <#if tagError??>
                     <div class="invalid-feedback">
                         ${tagError}
                     </div>
                    </#if>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="hidden" name="id" value="<#if message??>${message.id}</#if>">
                <div class="form-group">
                    <button class="btn btn-primary" type="submit">Save message</button>
                </div>
            </form>
        </div>
    </div>
<script>
    var link = window.location.href;
    var message = '';
    if (link.includes("main")){
        message = 'Add message';
    } else {
        message = 'Message edit';
    }
    document.getElementById("message").innerHTML = message;
</script>