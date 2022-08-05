<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Поиск игр</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="hero">Имя пользователя</label>
                <select id="hero" class="form-control">
                    <option value="">Введите имя</option>
                    <option value="pudge">Pudge</option>
                    <option value="nepudge">nePudge</option>
                </select>

            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск по герою</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-deck">
        <#list games as game>
            <a href="/game/${game.id}" class="game-link">
                <div class="card text-white bg-dark my-3 game">

                    <div class="card-body" >
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