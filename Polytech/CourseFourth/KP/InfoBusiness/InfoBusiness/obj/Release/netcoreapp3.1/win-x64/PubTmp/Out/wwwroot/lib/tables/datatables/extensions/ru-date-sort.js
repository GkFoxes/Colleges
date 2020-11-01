/// <summary>
/// только для сортировки дат формата "dd.MM.yyyy HH:mm:ss" и "dd.MM.yyyy HH:mm"
/// </summary>
function ruDateTimeAsc(a, b) {
    var x, y;
    if (jQuery.trim(a) !== '') {
        var deDatea = jQuery.trim(a).split(' ');
        var deTimea = deDatea[1].split(':');
        var deDatea2 = deDatea[0].split('.');
        if (typeof deTimea[2] != 'undefined') {
            x = (deDatea2[2] + deDatea2[1] + deDatea2[0] + deTimea[0] + deTimea[1] + deTimea[2]) * 1;
        } else {
            x = (deDatea2[2] + deDatea2[1] + deDatea2[0] + deTimea[0] + deTimea[1]) * 1;
        }
    } else {
        x = -Infinity; // = l'an 1000 ...
    }

    if (jQuery.trim(b) !== '') {
        var deDateb = jQuery.trim(b).split(' ');
        var deTimeb = deDateb[1].split(':');
        deDateb = deDateb[0].split('.');
        if (typeof deTimeb[2] != 'undefined') {
            y = (deDateb[2] + deDateb[1] + deDateb[0] + deTimeb[0] + deTimeb[1] + deTimeb[2]) * 1;
        } else {
            y = (deDateb[2] + deDateb[1] + deDateb[0] + deTimeb[0] + deTimeb[1]) * 1;
        }
    } else {
        y = -Infinity;
    }
    var z = ((x < y) ? -1 : ((x > y) ? 1 : 0));
    return z;
}

function ruDateTimeDesc(a, b) {
    return ruDateTimeAsc(b, a);
}

/// <summary>
/// только для сортировки дат формата "dd.MM.yyyy"
/// </summary>
function ruDateAsc(a, b) {
    var x, y;
    if (jQuery.trim(a) !== '') {
        var deDatea = jQuery.trim(a).split('.');
        x = (deDatea[2] + deDatea[1] + deDatea[0]) * 1;
    } else {
        x = Infinity; // = l'an 1000 ...
    }

    if (jQuery.trim(b) !== '') {
        var deDateb = jQuery.trim(b).split('.');
        y = (deDateb[2] + deDateb[1] + deDateb[0]) * 1;
    } else {
        y = -Infinity;
    }
    var z = ((x < y) ? -1 : ((x > y) ? 1 : 0));
    return z;
}

function ruDateDesc(a, b) {
    return ruDateAsc(b, a);
}

function ruDateWorkShipAsc(a, b) {
    var aSplit = a.split(',')[0];
    var bSplit = b.split(',')[0];
    return ruDateAsc(aSplit, bSplit);
}

function ruDateWorkShipDesc(a, b) {
    return ruDateWorkShipAsc(b, a);
}

jQuery.extend(jQuery.fn.dataTableExt.oSort, {
    "ru_datetime-asc": ruDateTimeAsc,
    "ru_datetime-desc": ruDateTimeDesc,
    "ru_date-asc": ruDateAsc,
    "ru_date-desc": ruDateDesc,
    "ru_date_workShip-asc": ruDateWorkShipAsc,
    "ru_date_workShip-desc": ruDateWorkShipDesc
});