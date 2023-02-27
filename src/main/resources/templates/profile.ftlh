<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Личный кабинет</h1>
    <hr>
    <div style="text-align: center">
        <h1>${user.name}</h1>
        <#if avatarExist>
            <form method="post" enctype="multipart/form-data" class="">
                <div>
                    <label>
                        <img src="/storage/${user.getAvatar()}"
                             style="border:2px solid black; border-radius: 20px" height="240"  alt="">
                        <input type="file" name="file" hidden>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </label>
                </div>
                    <button type="submit" style="width: 10%" class="btn btn-dark">Добавить</button>
            </form>
             <#else>
                 <form method="post" enctype="multipart/form-data" class="">
                     <div>
                 <label>
                     <img src="/static/images/avatar.png"
                          style="border:0 solid black; border-radius: 20px" height="120" alt="">
                     <input type="file" name="file" hidden>
                     <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                 </label>
                     </div>
                 <button type="submit"  class="btn btn-dark">Добавить</button>
                 </form>
        </#if>
        <br>
        <h3>WinRate: ${winRate}%</h3>
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
        <small class="text-muted"> Дата создания: <b>${user.getDateOfCreated()}</b> </small>
    </div>
</@t.template>