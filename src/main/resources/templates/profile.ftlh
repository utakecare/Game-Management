<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Личный кабинет</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <img src="/static/images/avatar${user.id}.png"
             style="border:2px solid black; border-radius: 20px" height="120" alt="">
        <form method="post" enctype="multipart/form-data">
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type = "submit" value = "yes" />
        </form>
<#--        <form action="/profile" method="post" enctype="multipart/form-data" modelAttribute="user">-->
<#--            <input type="file" name="imgFile">-->
<#--            <input type = "submit" value = "yes" />-->
<#--        </form>-->
        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        Дата создания: <b>${user.getDateOfCreated()}</b>
        <br>
        <br>
        <#if user.isAdmin()>
            <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
               href="/admin">
                Панель администратора
            </a><br>
        </#if>
        <a class="btn btn-dark mb-3" style="text-align: center; width: 100%"
           href="/my/games">
            Мои игры
        </a>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="text-align: center; width: 100%" class="btn btn-danger mb-2">
                Выйти из аккаунта
            </button>
        </form>
    </div>
</@t.template>