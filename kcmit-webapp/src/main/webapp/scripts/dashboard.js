function setupTabRetrieval() {
    jQuery(document).on("shown.bs.tab", "[data-type='Uif-TabGroup']", function(event) {
        var tabId = jQuery(event.target).attr("id").replace("_tab", "_tabPanel");
        var placeholder = jQuery("#" + tabId).find("> ." + kradVariables.CLASSES.PLACEHOLDER);
        if (placeholder.length) {
            retrieveComponent(placeholder.attr("id"));
        }
    });
}