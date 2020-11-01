//Main version; Last edit: 19/09/19; 
var filterCounter = 0;  //буферная переменная, чтобы создавать уникальные id для интервальных фильтров;
var TableId;

//запуск после полной прогрузки страницы;
$(function () {
    //if (($('.filterTable').length != 0) || ($('.filter').length == 0)) return; //если фильтр создан или он не подключен, то return;
    $('.table').each(function (d, t) {
        TableId = t.id;
        if (TableId) {
            if (!$.fn.DataTable.isDataTable('#' + TableId)) {
                var dom;

                var legends = $('#legend').map(function (ind, el) {
                    if ($(el).data("legend-for") == TableId)
                        return el;
                });

                if (legends.length > 0)
                    dom = '<"datatable-header"B><"datatable-header"lf><"datatable-header"<"#legend-wrapper.pull-left mt-10">><"datatable-scroll"t><"datatable-footer"ip>';
                else
                    dom = '<"datatable-header"f><"datatable-header"><"datatable-scroll"Bt><"datatable-footer"ip>';

                var buttons = [
                    {
                        text: 'Сброс фильтров',
                        action: function (e, dt, node, config) {
                            location.reload(false);
                        },
                    },
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
                if ($($('#' + TableId + " tbody tr")[0]).find("td").length < 2)
                    buttons.shift();

                $('#' + TableId).dataTable({
                    dom: dom,
                    bSortCellsTop: true,//делаем сортировку по верхнему хеадеру
                    buttons: buttons,
                    columnDefs: [
                        { orderable: false, targets: '_all' }
                    ],
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
                    },
                    initComplete: function () {
                        var $legend = $('.datatable-header').find('#legend-wrapper');
                        $('#legend').each(function (ind, el) {
                            if ($(el).data("legend-for") == TableId)
                                $legend.append($(legend).get(0).innerHTML);
                        })
                    }
                });
            }

            var SimpleSearch = $("#" + TableId + ">tfoot>tr [filter = SimpleSearch]");
            var DateTime = $("#" + TableId + ">tfoot>tr [filter = DateTime]");
            var ListSearch = $("#" + TableId + ">tfoot>tr [filter = ListSearch]");
            var ListSearchInList = $("#" + TableId + ">tfoot>tr [filter = ListSearchInList]");
            var IntervalSearchInt = $("#" + TableId + ">tfoot>tr [filter = IntervalSearchInt]");
            var IntervalSearchFloat = $("#" + TableId + ">tfoot>tr [filter = IntervalSearchFloat]");
            var CombineOrderSearch = $("#" + TableId + ">tfoot>tr [filter = CombineOrderSearch]");
            $('#' + TableId).addClass("table-striped");
            var Table = $('#' + TableId);

            SimpleSearch.each(function (a, b) { createSimpleSearch($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
            DateTime.each(function (a, b) { createDateTime($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
            ListSearch.each(function (a, b) { createListSearch($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
            ListSearchInList.each(function (a, b) { createListSearchInList($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
            IntervalSearchInt.each(function (a, b) { createIntervalSearchInt($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
            IntervalSearchFloat.each(function (a, b) { createIntervalSearchFloat($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
            CombineOrderSearch.each(function (a, b) { createCombineOrderSearch($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });


        }
    })


    $('.dataTables_wrapper').find('select').selectpicker({ width: 'auto' });
});


function tableFilterUpdate() {
    $(document).ready(function () {
        try {
            if (($('.filterTable').length != 0) || ($('.filter').length == 0)) return; //если фильтр создан или он не подключен, то return;
            $('.table').each(function (d, t) {
                TableId = t.id;
                if (TableId) {
                    var SimpleSearch = $("#" + TableId + ">tfoot>tr [filter = SimpleSearch]");
                    var DateTime = $("#" + TableId + ">tfoot>tr [filter = DateTime]");
                    var ListSearch = $("#" + TableId + ">tfoot>tr [filter = ListSearch]");
                    var IntervalSearchInt = $("#" + TableId + ">tfoot>tr [filter = IntervalSearchInt]");
                    var IntervalSearchFloat = $("#" + TableId + ">tfoot>tr [filter = IntervalSearchFloat]");
                    var CombineOrderSearch = $("#" + TableId + ">tfoot>tr [filter = CombineOrderSearch]");

                    SimpleSearch.each(function (a, b) { createSimpleSearch($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
                    DateTime.each(function (a, b) { createDateTime($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
                    ListSearch.each(function (a, b) { createListSearch($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
                    IntervalSearchInt.each(function (a, b) { createIntervalSearchInt($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
                    IntervalSearchFloat.each(function (a, b) { createIntervalSearchFloat($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
                    CombineOrderSearch.each(function (a, b) { createCombineOrderSearch($('#' + TableId).DataTable().columns(columnNumberInTable(b.id)), b.id); });
                }
            })
        }
        catch (err) { console.log(err); }
        $('.dataTables_wrapper').find('select').selectpicker({ width: 'auto' });
    });
}
function columnNumberInTable(id) {
    var filterHead = $('#' + this.TableId + '>tfoot>tr.filter').children();
    for (var i = 0; i < filterHead.length; i++) {
        var elements_in_column = filterHead[i].getElementsByTagName('div');
        for (var j = 0; j < elements_in_column.length; j++) {
            if (elements_in_column[j].id == id) return i;
        }
    }
}
function unique(arr) {
    let result = [];
    arr.forEach(function (d, t) {
        if (!result.includes(d)) {
            result.push(d);
        }
    })
    return result;
}

function createDateTime(column, id) {
    //find mindate + maxdate
    var processed = [];
    var minDt = new Date();
    var maxDt = new Date();
    column.data().unique().each(function (e) {
        processed = processed.concat(e);
    });
    processed.forEach(function (d, j) {
        try { var a = (d.match(/(\d+\.\d+\.\d+(\ \d+\:\d+)?)/g)[0]).replace(/[^\d+]/g, ' ').split(' ') } catch (err) { console.log("В datefilter не дата!") }
        if (a != null) {
            var date = new Date(a[2], --(a[1]), a[0]);
            if (date > maxDt) maxDt = date;
            if (date < minDt) minDt = date;
        }
    });

    var filterHtml = '<input type="text" class="form-control" name="datefilter" value="" style="font-weight:400; padding:1px;"/>';

    //$(filterHtml).appendTo($(id));
    //init daterangepicker
    $(filterHtml).appendTo($('#' + id)).daterangepicker({
        timePicker: true,
        applyClass: 'bg-slate-600',
        cancelClass: 'btn-default',
        timePicker24Hour: true,
        locale: {
            format: 'DD.MM.YYYY',
            applyLabel: 'Выбрать',
            cancelLabel: 'Очистить',
            startLabel: 'Начальная дата',
            endLabel: 'Конечная дата',
            customRangeLabel: 'Выбрать дату',
            daysOfWeek: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
            monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
            firstDay: 1,
        },
        minDate: minDt,
        maxDate: maxDt,
    },
        //sort datevalue
        function (start, end, label) {
            var processed = [];
            var regexp = '';
            column.data().unique().each(function (e) {
                processed = processed.concat(e);
            });
            processed.forEach(function (d, j) {
                try { var a = (d.match(/(\d+\.\d+\.\d+(\ \d+\:\d+)?)/g)[0]).replace(/[^\d+]/g, ' ').split(' '); } catch (err) { return; }
                var date = new Date(a[2], --(a[1]), a[0]);

                var b = start.format('DD.MM.YYYY HH:MM:SS').replace(/[^\d+]/g, ' ').split(' ');
                var startDate = new Date(b[2], --(b[1]), b[0]);

                var c = end.format('DD.MM.YYYY HH:MM:SS').replace(/[^\d+]/g, ' ').split(' ');
                var endDate = new Date(c[2], --(c[1]), c[0]);
                if ((date >= startDate) && (date <= endDate)) {
                    regexp += '(' + d.match(/(\d+\.\d+\.\d+(\ \d+\:\d+)?)/g)[0] + ')|';
                }
            });
            column.search((regexp.length == 0) ? null : ('(' + regexp.slice(0, -1) + ')'), true, false).draw();
        })
        .on('cancel.daterangepicker', function (ev, picker) {
            $(this).val('');
            column.search('').draw();
        });

}             //фильтр по дате
function createSimpleSearch(column, id) {
    var filterHtml = '<input type="text" class="form-control" placeholder="Искать..." style="font-weight:400;" class="filterTable"/>';
    $(filterHtml).appendTo($('#' + id))
        .on('keyup change', function () {
            column.search(this.value).draw();
        });
}
function createCombineOrderSearch(column, id) {
    var filterHtml = '<input type="text" class="form-control" placeholder="Искать..." style="font-weight:400;" class="filterTable"/>';
    $(filterHtml).appendTo($('#' + id))
        .on('keyup change', function () {
            var processed = [];
            var regexp = '';
            column.data().unique().each(function (e) {
                processed = processed.concat(e);
            });
            processed.forEach(function (d, j) {
                var columnValue = d.match(/((\d+-)?\d+)/g)[1];
                regexp += columnValue.includes(this.value) ? '>(' + columnValue + ')<|' : '';
            });
            column.search((regexp.length == 0) ? null : ('(' + regexp.slice(0, -1) + ')'), true, false).draw();

        });
}   //фильтр по номеру заявки 
function createListSearch(column, id) {
    var selectHtml = '<select data-none-selected-text="Все записи" data-selected-text-format="count > 1" data-count-selected-text="Выбрано {0} из {1}" multiple="multiple" class="form-control filterTable" style="font-weight:400;"data-live-search="true"></select>';
    var select = $(selectHtml).appendTo($('#' + id))
        .on('change',
            function () {
                var selected = $(this).val();
                var val = Array.isArray(selected)
                    ? selected.map($.fn.dataTable.util.escapeRegex).join('|')
                    : (selected ? $.fn.dataTable.util.escapeRegex(selected) : '');
                var regexp = (val.length == 0) ? ('(' + ')') : ('^(' + val.replace(/\"/g, '\'\'') + ')$');//название с " не распознаётся, заменяем на '';
                column.search(regexp, true, false).draw();
            });
    //заполняем список уникальными названиями;
    var processed = [];
    column.data().unique().each(function (e) {
        if (e !== null) { processed = processed.concat(e); }
    });
    processed = unique(processed);
    processed.forEach(function (d, j) {
        d = (/<.+>(.+)<.+>/).exec(d) !== null ? (/<.+>(.+)<.+>/).exec(d)[1] : d;  //достаём название из разделителей, если они есть; 
        var val = d.replace(/\"/g, '\'\'');                                   //название с " не распознаётся, заменяем на '';
        if (d.length !== 0) select.append('<option value="' + val + '">' + val + '</option>');
    });
}
function createListSearchInList(column, id) {      //для элемента li
    var selectHtml = '<select data-none-selected-text="Все записи" data-selected-text-format="count > 1" data-count-selected-text="Выбрано {0} из {1}" multiple="multiple" class="form-control filterTable" style="font-weight:400;"data-live-search="true"></select>';
    var select = $(selectHtml).appendTo($('#' + id))
        .on('change',
            function () {
                var selected = $(this).val();
                var val = Array.isArray(selected)
                    ? selected.map($.fn.dataTable.util.escapeRegex).join('|')
                    : (selected ? $.fn.dataTable.util.escapeRegex(selected) : '');
                var regexp = (val.length == 0) ? ('(' + ')') : ('(' + val.replace(/\"/g, '\'\'') + ')');//название с " не распознаётся, заменяем на '';
                console.log(regexp);
                column.search(regexp, true, false).draw();
            });
    //заполняем список уникальными названиями;
    var processed = [];
    column.data().unique().each(function (e) {
        e.forEach(function (d) {
            if ((/<.+>(.+)<.+>/).exec(d) !== null) {
                processed = processed.concat((/<.+>(.+)<.+>/).exec(d)[0]);
            }
        })
    });
    processed = unique(processed);
    processed.forEach(function (d, j) {
        d = (/<.+>(.+)<.+>/).exec(d) !== null ? (/<.+>(.+)<.+>/).exec(d)[1] : d;
        var val = d.replace(/\"/g, '\'\'');
        select.append('<option value="' + val + '">' + val + '</option>');
    });

}
function createIntervalSearchInt(column, id) {
    //определяем max и min в column
    var processed = [];
    column.data().unique().each(function (e) {
        processed = processed.concat(e);
    });

    var MaxColumnValue = isNaN(parseInt(processed[0])) ? 0 : parseInt(processed[0]);
    var MinColumnValue = isNaN(parseInt(processed[0])) ? 0 : parseInt(processed[0]);
    var MinValueInFilter = 0;
    var MaxValueInFilter = 0;

    processed.forEach(function (d, j) {
        var value = isNaN(parseInt(d)) ? 0 : parseInt(d);
        if (value > MaxColumnValue) MaxColumnValue = value;
        if (value < MinColumnValue) MinColumnValue = value;
    });

    MinValueInFilter = MinColumnValue;
    MaxValueInFilter = MaxColumnValue;
    var filterHtml = '<span>От:</span>' + '<input type="text" class="form-control" placeholder="Искать..." style="font-weight:400;"' + "id=\"Interval_Begin_" + filterCounter + '\"class="filterTable"/>';
    $(filterHtml).appendTo($('#' + id));
    $("#Interval_Begin_" + filterCounter)
        .on('keyup change', function () {
            var id = (parseInt(this.id.replace("Interval_Begin_", "")));

            MinValueInFilter = parseInt(this.value);
            if (isNaN(MaxValueInFilter)) { MaxValueInFilter = MaxColumnValue; }
            if (isNaN(MinValueInFilter)) { MinValueInFilter = MinColumnValue; }

            var processed = [];
            var regexp = "";

            column.data().unique().each(function (e) {
                processed = processed.concat(e);
            });
            processed.forEach(function (d, j) {
                var value = parseInt(d);
                if ((value >= MinValueInFilter) && (value <= MaxValueInFilter)) {
                    regexp += '^(' + d + ')$|';
                }
            });
            column.search((regexp.length == 0) ? null : ('(' + regexp.slice(0, -1) + ')'), true, false).draw();
        });

    var filterHtml = '<span>До:</span>' + '<input type="text" class="form-control" placeholder="Искать..." style="font-weight:400;"' + "id=\"Interval_End_" + filterCounter + '\"class="filterTable"/>';
    $(filterHtml).appendTo($('#' + id));
    $("#Interval_End_" + filterCounter)
        .on('keyup change', function () {
            var id = (parseInt(this.id.replace("Interval_End_", "")));

            MaxValueInFilter = parseInt(this.value);
            if (isNaN(MaxValueInFilter)) { MaxValueInFilter = MaxColumnValue; }
            if (isNaN(MinValueInFilter)) { MinValueInFilter = MinColumnValue; }

            var processed = [];
            var regexp = "";

            column.data().unique().each(function (e) {
                processed = processed.concat(e);
            });
            processed.forEach(function (d, j) {
                var value = parseInt(d);
                if ((value >= MinValueInFilter) && (value <= MaxValueInFilter)) {
                    regexp += '^(' + d + ')$|';
                }
            });
            column.search((regexp.length == 0) ? null : ('(' + regexp.slice(0, -1) + ')'), true, false).draw();
        });

    $("#Interval_Begin_" + filterCounter).val(MinColumnValue);
    $("#Interval_End_" + filterCounter).val(MaxColumnValue);

    MaxValueInFilter = MaxColumnValue;
    MinValueInFilter = MinColumnValue;
    filterCounter++;
}
function createIntervalSearchFloat(column, id) {
    //определяем max и min в column
    var processed = [];
    column.data().unique().each(function (e) {
        processed = processed.concat(e);
    });
    var MaxColumnValue = isNaN(parseFloat((processed[0]).replace(",", "."))) ? 0.0 : parseFloat((processed[0]).replace(",", "."));
    var MinColumnValue = isNaN(parseFloat((processed[0]).replace(",", "."))) ? 0.0 : parseFloat((processed[0]).replace(",", "."));
    var MinValueInFilter = 0.0;
    var MaxValueInFilter = 0.0;

    processed.forEach(function (d, j) {
        var value = isNaN(parseFloat(d)) ? 0 : parseFloat(d);
        if (value > MaxColumnValue) MaxColumnValue = value;
        if (value < MinColumnValue) MinColumnValue = value;
    });

    MinValueInFilter = MinColumnValue;
    MaxValueInFilter = MaxColumnValue;

    var filterHtml = '<span>От:</span>' + '<input type="text" class="form-control" placeholder="Искать..." style="font-weight:400;"' + "id=\"Interval_Begin_" + filterCounter + '\"class="filterTable"/>';
    $(filterHtml).appendTo($('#' + id));
    $("#Interval_Begin_" + filterCounter)
        .on('keyup change', function () {

            MinValueInFilter = parseFloat(this.value.replace(",", "."));
            if (isNaN(MaxValueInFilter)) { MaxValueInFilter = MaxColumnValue; }
            if (isNaN(MinValueInFilter)) { MinValueInFilter = MinColumnValue; }

            var processed = [];
            var regexp = "";

            column.data().unique().each(function (e) {
                processed = processed.concat(e);
            });
            processed.forEach(function (d, j) {
                var value = parseFloat(d.replace(",", "."));
                if ((value >= MinValueInFilter) && (value <= MaxValueInFilter)) {
                    regexp += '^(' + d + ')$|';
                }
            });
            column.search((regexp.length == 0) ? null : ('(' + regexp.slice(0, -1) + ')'), true, false).draw();
        });

    var filterHtml = '<span>До:</span>' + '<input type="text" class="form-control" placeholder="Искать..." style="font-weight:400;"' + "id=\"Interval_End_" + filterCounter + '\"class="filterTable"/>';
    $(filterHtml).appendTo($('#' + id));
    $("#Interval_End_" + filterCounter)
        .on('keyup change', function () {

            MaxValueInFilter = parseFloat(this.value.replace(",", "."));
            if (isNaN(MaxValueInFilter)) { MaxValueInFilter = MaxColumnValue; }
            if (isNaN(MinValueInFilter)) { MinValueInFilter = MinColumnValue; }

            var processed = [];
            var regexp = "";

            column.data().unique().each(function (e) {
                processed = processed.concat(e);
            });
            processed.forEach(function (d, j) {
                var value = parseFloat(d.replace(",", "."));
                if ((value >= MinValueInFilter) && (value <= MaxValueInFilter)) {
                    regexp += '^(' + d + ')$|';
                }
            });
            column.search((regexp.length == 0) ? null : ('(' + regexp.slice(0, -1) + ')'), true, false).draw();
        });

    $("#Interval_Begin_" + filterCounter).val(MinColumnValue);
    $("#Interval_End_" + filterCounter).val(MaxColumnValue);

    MaxValueInFilter = MaxColumnValue;
    MinValueInFilter = MinColumnValue;
    filterCounter++;
}


