var Kc = Kc || {};
Kc.PropDev = Kc.PropDev || {};
Kc.PropDev.Budget = Kc.PropDev.Budget || {};
(function(namespace, $) {
	namespace.copyBudget = function(budgetId, e) {
		$(e.currentTarget).find("input[name$='originalBudgetId']").val(budgetId);
	};
    namespace.totalUnallocatedFandA = function (values){
        var totalUnallocated = $('#PropBudget-UnrecoveredFandAPage-Group').data('total_unrecovered');
        for (var i = 0; i < values.length; i++) {
            totalUnallocated-=values[i];
        }
        return totalUnallocated;
    };
})(Kc.PropDev.Budget, jQuery);