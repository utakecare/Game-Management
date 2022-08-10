<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Личный кабинет</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <#if avatarExist>
        <img src="/static/images/${user.avatar}"
             style="border:2px solid black; border-radius: 20px" height="120" alt="">
             <#else>
                 <img src="/static/images/avatar.png"
                      style="border:0 solid black; border-radius: 20px" height="120" alt="">
        </#if>

            <form method="post" enctype="multipart/form-data" class="">
            <div class="custom-file">
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" style="width: 10%" class="btn btn-dark">Добавить</button>
            </div>
            </form>

        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
        <h2>${winRate}%</h2>
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