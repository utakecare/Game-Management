<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Мои Игры</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новую игру
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/game/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="selfRate">Ваша игра</label>
                    <select id="selfRate" required name="selfRate" class="form-control">
                        <option value="">Оцените свою игру от 1 до 10</option>
                        <option value="1">Ужасно</option>
                        <option value="2">Плохо</option>
                        <option value="3">Нормально</option>
                        <option value="4">Хорошо</option>
                        <option value="5">Отлично</option>
                    </select>
            </div>
            <div class="form-group">
                <label for="teamRate">Игра союзников</label>
                    <select id="teamRate" required name="teamRate" class="form-control">
                        <option value="">Оцените игру союзников от 1 до 10</option>
                        <option value="1">Ужасно</option>
                        <option value="2">Плохо</option>
                        <option value="3">Нормально</option>
                        <option value="4">Хорошо</option>
                        <option value="5">Отлично</option>
                    </select>
            </div>
            <div class="form-group">
                <label for="enjoyment">Удовольствие от игры</label>
                <select id="enjoyment" required name="enjoyment" class="form-control">
                    <option value="">Оцените полученное удовольствие от игры</option>
                    <option value="1">Ужасно</option>
                    <option value="2">Плохо</option>
                    <option value="3">Нормально</option>
                    <option value="4">Хорошо</option>
                    <option value="5">Отлично</option>
                </select>
            </div>
            <div class="form-group">
                <label for="addresult">Результат матча</label>
                    <select id="addresult" required name="result" class="form-control">
                        <option value="">Результат не выбран</option>
                        <option value="Победа">Победа</option>
                        <option value="Поражение">Поражение</option>
                    </select>
            </div>
            <div class="form-group">
                <label for="comment">Комментарий к игре</label>
                <textarea class="form-control" id="comment" name="comment"></textarea>
            </div>
            <div class="form-group">
                <label for="hero">Герой</label>
                <textarea required class="form-control"  id="hero" name="hero"></textarea>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>
    <div class="card-deck">
        <#list games as game>
            <a href="/game/${game.id}" class="game-link">
                <div class="card text-white bg-dark my-3 game">

                    <div class="card-body" >
                        <h5 class="card-title">${game.result}</h5>
                        <p class="card-text">${game.hero}</p>
                        <p class="card-subtitle">${game.date}</p>
                    </div>
                    <div class="card-footer">
                        <form action="/game/delete/${game.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Удалить
                            </button>
                        </form>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>