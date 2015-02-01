#/bin/bash
set -e
source $(dirname $0)/../src/libfnord/fnord-base/assets.sh

fn_assets_init
fn_assets_add "fnord/fnord.js" "src/libfnord/fnord-webcomponents/fnord.js"
fn_assets_add "fnord/3rdparty/codemirror.js" "src/libfnord/fnord-webcomponents/3rdparty/codemirror.js"
fn_assets_add "fnord/3rdparty/fontawesome.woff" "src/libfnord/fnord-webcomponents/3rdparty/fontawesome.woff"
fn_assets_add "fnord/3rdparty/fontawesome.css" "src/libfnord/fnord-webcomponents/3rdparty/fontawesome.css"
fn_assets_add "fnord/3rdparty/reset.css" "src/libfnord/fnord-webcomponents/3rdparty/reset.css"
fn_assets_add "fnord/components/fn-table.css" "src/libfnord/fnord-webcomponents/components/fn-table.css"
fn_assets_add "fnord/components/fn-button.css" "src/libfnord/fnord-webcomponents/components/fn-button.css"
fn_assets_add "fnord/components/fn-modal.css" "src/libfnord/fnord-webcomponents/components/fn-modal.css"
fn_assets_add "fnord/components/fn-tabbar.css" "src/libfnord/fnord-webcomponents/components/fn-tabbar.css"
fn_assets_add "fnord/components/fn-message.css" "src/libfnord/fnord-webcomponents/components/fn-message.css"
fn_assets_add "fnord/components/fn-tooltip.css" "src/libfnord/fnord-webcomponents/components/fn-tooltip.css"
fn_assets_add "fnord/themes/midnight-blue.css" "src/libfnord/fnord-webcomponents/themes/midnight-blue.css"
fn_assets_add "fnord/components/fn-appbar.html" "src/libfnord/fnord-webcomponents/components/fn-appbar.html"
fn_assets_add "fnord/components/fn-button.html" "src/libfnord/fnord-webcomponents/components/fn-button.html"
fn_assets_add "fnord/components/fn-button-group.html" "src/libfnord/fnord-webcomponents/components/fn-button-group.html"
fn_assets_add "fnord/components/fn-icon.html" "src/libfnord/fnord-webcomponents/components/fn-icon.html"
fn_assets_add "fnord/components/fn-input.html" "src/libfnord/fnord-webcomponents/components/fn-input.html"
fn_assets_add "fnord/components/fn-loader.html" "src/libfnord/fnord-webcomponents/components/fn-loader.html"
fn_assets_add "fnord/components/fn-menu.html" "src/libfnord/fnord-webcomponents/components/fn-menu.html"
fn_assets_add "fnord/components/fn-search.html" "src/libfnord/fnord-webcomponents/components/fn-search.html"
fn_assets_add "fnord/components/fn-table.html" "src/libfnord/fnord-webcomponents/components/fn-table.html"
fn_assets_add "fnord/components/fn-splitpane.html" "src/libfnord/fnord-webcomponents/components/fn-splitpane.html"
fn_assets_add "fnord/components/fn-codeeditor.html" "src/libfnord/fnord-webcomponents/components/fn-codeeditor.html"
fn_assets_add "fnord/components/fn-dropdown.html" "src/libfnord/fnord-webcomponents/components/fn-dropdown.html"
fn_assets_add "fnord/components/fn-datepicker.html" "src/libfnord/fnord-webcomponents/components/fn-datepicker.html"
fn_assets_add "fnord/components/fn-timeinput.html" "src/libfnord/fnord-webcomponents/components/fn-timeinput.html"
fn_assets_add "fnord/components/fn-daterangepicker.html" "src/libfnord/fnord-webcomponents/components/fn-daterangepicker.html"
fn_assets_add "fnord/components/fn-tabbar.html" "src/libfnord/fnord-webcomponents/components/fn-tabbar.html"
fn_assets_add "fnord/components/fn-modal.html" "src/libfnord/fnord-webcomponents/components/fn-modal.html"
fn_assets_add "fnord/components/fn-pager.html" "src/libfnord/fnord-webcomponents/components/fn-pager.html"
fn_assets_add "fnord/components/fn-tooltip.html" "src/libfnord/fnord-webcomponents/components/fn-tooltip.html"
fn_assets_add "fnord/components/fn-flexbox.html" "src/libfnord/fnord-webcomponents/components/fn-flexbox.html"
fn_assets_add "fnordmetric/fnordmetric-app.html" "src/fnordmetric/webui/fnordmetric-app.html"
fn_assets_add "fnordmetric/fnordmetric-console.html" "src/fnordmetric/webui/fnordmetric-console.html"
fn_assets_add "fnordmetric/fnordmetric-metric-list.html" "src/fnordmetric/webui/fnordmetric-metric-list.html"
fn_assets_add "fnordmetric/fnordmetric-search.html" "src/fnordmetric/webui/fnordmetric-search.html"
fn_assets_add "fnordmetric/fnordmetric-query-editor.html" "src/fnordmetric/webui/fnordmetric-query-editor.html"
fn_assets_add "fnordmetric/fnordmetric-metric-preview.html" "src/fnordmetric/webui/fnordmetric-metric-preview.html"
fn_assets_add "fnordmetric/fnordmetric-controls.html" "src/fnordmetric/webui/fnordmetric-controls.html"
fn_assets_add "fnordmetric/fnordmetric-time-controls.html" "src/fnordmetric/webui/fnordmetric-time-controls.html"
fn_assets_add "fnordmetric/fnordmetric-webui.html" "src/fnordmetric/webui/fnordmetric-webui.html"
fn_assets_add "fnordmetric/fnordmetric-webui.css" "src/fnordmetric/webui/fnordmetric-webui.css"
fn_assets_add "fnordmetric/fnordmetric-webui-util.js" "src/fnordmetric/webui/fnordmetric-webui-util.js"
fn_assets_add "fnordmetric/fnordmetric-embed-query-popup.html" "src/fnordmetric/webui/fnordmetric-embed-query-popup.html"