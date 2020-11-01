// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

//Datatables default settings
var dom = 'l<"datatable-header"f><"datatable-header"><"datatable-scroll"Bt><"datatable-footer"ip>';
var buttons = [
    //{
    //    text: 'Сброс фильтров',
    //    action: function (e, dt, node, config) {
    //        location.reload(false);
    //    },
    //},
    {
        extend: 'excel',
        exportOptions: {
            columns: ':visible th:not(.no-export)'
        }
    },
    {
        extend: 'print',
        exportOptions: {
            columns: ':visible th:not(.no-export)'
        }
    }
];

$.extend(true, $.fn.dataTable.defaults, {
    dom: dom,
    buttons: buttons,
    columnDefs: [
        { orderable: true, targets: '_all' }
    ],
    "pageLength": 50,
    language: {
        search: '<span>Поиск:</span> _INPUT_',
        searchPlaceholder: '',
        lengthMenu: '<span>Показать:</span> _MENU_',
        processing: "Подождите...",
        //lengthMenu: "Показать _MENU_ записей",
        info: "Записи с _START_ до _END_ из _TOTAL_ записей",
        infoEmpty: "Записи с 0 до 0 из 0 записей",
        infoFiltered: "(отфильтровано из _MAX_ записей)",
        infoPostFix: "",
        loadingRecords: "Загрузка записей...",
        zeroRecords: "Записи отсутствуют.",
        emptyTable: "В таблице отсутствуют данные",
        paginate: { "first": "Первая", "previous": "Предыдущая", "next": "Следующая", "last": "Последняя" },
        aria: {
            "sortAscending": ": активировать для сортировки столбца по возрастанию",
            "sortDescending": ": активировать для сортировки столбца по убыванию"
        },
        buttons:
        {
            'print': "Вывод на печать",
            'excel': "Экспорт в Excel",
        }
    }
});

//для загрузки модального окна
$(function () {
    $('button[data-toggle="modal"]').click(function (event) {   //устанавливаем событие на изменение информации об организации
        var url = $(this).data('url');

        $.get(url).done(function (data) {                       //получаем форму для редактирования с помощью get-запроса
            $('#modal-placeholder').html(data);                 //помещаем полученную форму на страницу
            $('#modal-placeholder > .modal').modal('show');     //отображаем форму
        });
    });
});


window.onload = function () {

    $('#users-table').DataTable();


    //для обновления модального окна
    var placeholderElement = $('#modal-placeholder');                            //ищем контейнер для модального окна
    placeholderElement.on('click', '[data-save="modal"]', function (event) {     // создаём событие при нажатии на кнопку сохранить
        event.preventDefault();

        $('[data-save="modal"]').attr("disabled", true);                         //блокирем кнопку сохранить, пока не обработали запрос
        var form = $(this).parents('.modal').find('form');                       //получаем форму
        var actionUrl = form.attr('action');                                     //получаем url
        var dataToSend = form.serialize();                                       //сериализуем форму (из объекта в текст)

        $.post(actionUrl, dataToSend).done(function (data) {                     //отправляем post-запрос для обновления формы
            var newBody = $('.modal-body', data);                                //создаём элемент по полученной форме из контроллера
            placeholderElement.find('.modal-body').replaceWith(newBody);         //обновляем форму

            var isValid = $(".field-validation-error").length == 0;               //проверяем, есть ли ошибки ввода
            if (isValid) {
                placeholderElement.find('.modal').modal('hide');                  //закрываем модальное окно
                location.reload();                                                //перезагружаем страницу
            }
            $('[data-save="modal"]').attr("disabled", false);                     //разблокирем кнопку сохранить
        });
    });

}