/**
 * This file is part of the "FnordMetric" project
 *   Copyright (c) 2014 Laura Schlimmer
 *   Copyright (c) 2014 Paul Asmuth, Google Inc.
 *
 * FnordMetric is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License v3.0. You should have received a
 * copy of the GNU General Public License along with this program. If not, see
 * <http://www.gnu.org/licenses/>.
 */

if (FnordMetric === undefined) {
  FnordMetric = {};
}

if (FnordMetric.util === undefined) {
  FnordMetric.util = {};
}

FnordMetric.util.TableView = function(columns, elem, per_page) {
  var all_rows = [];
  var on_row_click = null;

  var per_page = parseInt(per_page);
  var current_page = 0;
  var pages;

  function render(isSortable) {
    if (isSortable == undefined) {
      isSortable = true;
    }
    elem.innerHTML = "";
    pages = Math.ceil(all_rows.length / per_page);
    var offset = current_page * per_page;
    var until = Math.min(offset + per_page, all_rows.length);
    renderPagination(offset+1,until, all_rows.length, isSortable);
    renderTable(all_rows.slice(offset, until), isSortable);
  }

  function updatePage(page_index, isSortable) {
    current_page = page_index;
    render(isSortable);
  }

  function resortRows(column_index, order) {
    FnordMetric.util.sortMetricList(
      all_rows, column_index, order);
    updatePage(0);
  }

  function renderTable(rows, isSortable) {
    var table = document.createElement("table");
    table.className = "metric_list";
    elem.appendChild(table);

    /* render header */
    var header = document.createElement("tr");
    table.appendChild(header);
    header.className = "list_header";

    for (var i = 0; i < columns.length; i++) {
      var header_cell = document.createElement("th");
      header_cell.innerHTML = columns[i];
      header.appendChild(header_cell);
      if (i != 1 && isSortable) {
        header_cell.className = "clickable";

        var sort_asc = FnordMetric.createButton(
          "#", "caret left", "&#x25B2;");
        sort_asc.setAttribute("id", i);
        sort_asc.onclick = function(e) {
          e.preventDefault();
          resortRows(this.id, "asc");
        }
        header_cell.appendChild(sort_asc);

        var sort_desc = FnordMetric.createButton(
          "#", "caret", "&#x25BC;");
        sort_desc.setAttribute("id", i);
        sort_desc.onclick = function(e) {
          e.preventDefault();
          resortRows(this.id, "desc");
        }
        header_cell.appendChild(sort_desc);
      }
    }

    /* render rows */
    rows.map(function(row) {
      var list_row = document.createElement("tr");
      table.appendChild(list_row);


      if (on_row_click != null) {
        list_row.addEventListener('click', on_row_click, false);
      }

      row.map(function(cell) {
        var list_cell = document.createElement("td");
        list_cell.innerHTML = cell;
        list_cell.setAttribute("id", cell);
        list_row.appendChild(list_cell);
      });
    });
  };

  function renderPagination(from, until, total, isSortable) {
    var navbar = document.createElement("div");
    navbar.className = "pagination_navbar metric";

    var ttp_forward = FnordMetric.createButton(
      "#", "pagination_tooltip", "&#8594;");
    navbar.appendChild(ttp_forward);
    ttp_forward.onclick = function(e) {
      e.preventDefault();
      updatePage((current_page + 1) % pages, isSortable);
    }

    var ttp_back = FnordMetric.createButton(
      "#", "pagination_tooltip",  "&#8592;");
    ttp_back.onclick = function(e) {
      e.preventDefault();
      updatePage((current_page + per_page) % pages, isSortable);
    }
    navbar.appendChild(ttp_back);

    var label = document.createElement("div");
    label.className = "pagination_label";
    label.innerHTML = from + " - " + until + " of " + total;
    navbar.appendChild(label);

    elem.appendChild(navbar);
  }

  function addRow(row) {
    all_rows.push(row);
  }

  function onRowClick(on_row_click_new) {
    on_row_click = on_row_click_new;
  }

  function renderEmptyTable(elem) {
    var table = document.createElement("table");
    table.className = "metric_list";
    var header = document.createElement("tr");
    header.className = "list_header";
    for (var i = 0; i < 4; i++) {
      var cell = document.createElement("th");
      header.appendChild(cell);
    }
    table.appendChild(header);

    for (var i = 0; i < 7; i++) {
      var row = document.createElement("tr");
      for (var j = 0; j < 4; j++) {
        var cell = document.createElement("td");
        row.appendChild(cell);
      }
      table.appendChild(row);
    }

    elem.appendChild(table);
  }

  return {
    "addRow": addRow,
    "onRowClick": onRowClick,
    "render": render,
    "renderEmptyTable" : renderEmptyTable
  };
};



