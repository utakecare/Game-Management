<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Авторизация</h1>
    <hr>
    <form action="/login " method="post">
        <div class="form-group">
            <label for="name">Логин</label>
            <input type="text" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="name" name="username">
            <div id="name" class="invalid-feedback">
                Неверный логин
            </div>
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
            <div id="password" class="invalid-feedback">
                Неверный пароль
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Войти</button>
    </form>
    <hr>
    <h2>Нет аккаунта GameManagement? <a href="/registration">Зарегистрируйся!</a></h2>
</@t.template>