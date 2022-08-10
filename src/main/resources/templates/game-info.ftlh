<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">

    </div>
    <hr>
    <table class="table table-dark table-hover">
        <thead>
        <tr>
            <th scope="col">Дата</th>
            <th scope="col">Время</th>
            <th scope="col">Герой</th>
            <th scope="col">Результат</th>
            <th scope="col">Мой вклад</th>
            <th scope="col">Вклад команды</th>
            <th scope="col">Удовольствие</th>
            <th scope="col">Комментарий к игре</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${game.date}</td>
            <td>${game.time}</td>
            <td>${game.hero}</td>
            <td>${game.result}</td>
            <td>${game.outputValue(game.selfRate)}</td>
            <td>${game.outputValue(game.teamRate)}</td>
            <td>${game.outputValue(game.enjoyment)}</td>
            <td>${game.comment}</td>

        </tr>
        </tbody>
    </table>

    <hr>
    <p style="text-align: center">
        <a href="/user/${whoseGame.id}">
            <#if whoseGame.isAvatarExist(whoseGame)>
            <img src="/static/images/${whoseGame.avatar}" alt="mdo" width="32" height="32" class="rounded-circle"> ${whoseGame.name}
            <#else>
                <img src="/static/images/avatar.png" alt="mdo" width="32" height="32" class="rounded-circle"> ${whoseGame.name}
            </#if>
        </a>
    </p>

</@t.template>