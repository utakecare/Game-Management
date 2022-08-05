<#import "blocks/template.ftlh" as t>
<@t.template user>
    `<h1 style="text-align: center">Панель администратора</h1><hr>
    <table class="table table-dark table-hover">
        <thead>
        <tr>
            <th scope="col">Логин</th>
            <th scope="col">Роли</th>
            <th scope="col">Редактирование</th>
            <th scope="col">Подробная информация</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <th>${user.name}</th>
                <th><#list user.roles as role>${role}</#list></th>
                <th><a href="/admin/user/edit/${user.id}">Редактировние</a></th>
                <th><a href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        </tbody>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>
</@t.template>