<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
        <#if avatarExist>
            <img src="/static/images/${user.avatar}"
                 style="border:2px solid black; border-radius: 20px" height="120" alt="">
                 <#else>
                     <img src="/static/images/avatar.png"
                          style="border:0 solid black; border-radius: 20px" height="120" alt="">
        </#if>

        <br>
        <br>
        <h2>${user.name}</h2>
        <br>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">Игры пользователя ${user.name}</h1>
    <br>
    <div class="card-columns">
        <#list games as game>
            <a href="/game/${game.id}" class="game-link">
                <div class="card text-white bg-dark my-3 game">
                    <div class="card-body">
                        <h5 class="card-title">${game.hero}</h5>
                        <p class="card-text">${game.result}</p>
                    </div>
                    <div class="card-footer">
                        ${game.user.name}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>