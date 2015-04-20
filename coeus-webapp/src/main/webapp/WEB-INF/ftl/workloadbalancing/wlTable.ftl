<#macro uif_lineItemTable group>


    <@krad.groupWrap group=group>


    <div id="wlTable">

            <#if !KualiForm.simulationMode>
                <div class="row workload-button-bar">
                    <div class="col-md-6"></div>
                    <div class="col-md-6 text-right">
                        <button id="production_charts_button"
                                class="btn btn-default btn-xs uif-action"
                                data-submit_data="{&quot;methodToCall&quot;:&quot;showProductionCharts&quot;}"
                                data-refreshid="Workload-Table"
                                data-role="Action">
                            Production Charts
                        </button>
                        <button id="simulation_mode_button"
                                class="btn btn-default btn-xs uif-action"
                                data-submit_data="{&quot;methodToCall&quot;:&quot;enterSimulationMode&quot;}"
                                data-refreshid="WorkloadBalancing-Page"
                                data-role="Action">
                            Simulation Mode
                        </button>
                    </div>
                </div>
            <#else>

                <div class="row workload-button-bar simulation-button-bar">
                    <div class="col-md-6">
                        <span class="icon-info2"></span>
                        Simulation Mode
                    </div>
                    <div class="col-md-6 text-right">
                        <button id="load_simulation_button"
                                class="btn btn-default btn-xs uif-action"
                                data-onclick="showDialog(&quot;Workload-LoadSimulation-Dialog&quot;);"
                                data-role="Action">
                            Load Simulation...
                        </button>
                        <button id="comparison_charts_button"
                                class="btn btn-default btn-xs uif-action"
                                data-submit_data="{&quot;methodToCall&quot;:&quot;showComparisonCharts&quot;}"
                                data-refreshid="Workload-Table"
                                data-role="Action">
                            Comparison Charts
                        </button>
                        <button id="exit_simulation_button"
                                class="btn btn-primary btn-xs uif-action"
                                data-submit_data="{&quot;methodToCall&quot;:&quot;exitSimulationMode&quot;}"
                                data-refreshid="WorkloadBalancing-Page"
                                data-role="Action">
                            Exit Simulation Mode
                        </button>
                    </div>
                </div>
            </#if>

        <table id="wl" class="table table-condensed ">

            <tbody id="wl-balance">

            <tr class="${group.headerRow.cssClass!} bgWhite">
                <#list group.headerRow.cellContent as cell>

                    <#if cell_index == 0>
                        <th class="table-title-cell" >
                            <div><span>${cell!}</span>
                                <a id="show_add_dialog"
                                   class="uif-actionLink" tabindex="0"
                                   data-onclick="showDialog(&quot;Workload-Add-Dialog&quot;);"
                                   data-role="Action">
                                    <span class="icon-plus"></span> Add
                                </a>
                            </div>
                        </th>
                    <#else>
                        <th class="rotate">
                            <div><span>${cell!}</span></div>
                        </th>
                    </#if>
                </#list>
                <th></th>
            </tr>

                <#list group.lineitemrows as row>
                <tr>

                    <td>${row.personName}
                        <div class="workload-line-buttons">
                            <div class="dropdown" style="display:inline; margin-right: 3px;">
                                <button id="edit_dropdown_${row_index}"
                                        class="btn btn-default btn-xs uif-action dropdown-toggle"
                                        data-onclick="return false;"
                                        data-toggle="dropdown"
                                        data-role="Action">
                                    Edit
                                    <span class="caret"></span>
                                </button>

                                <ul class="dropdown-menu uif-listLayout">
                                    <li>
                                        <a id="show_capacity_flexibility_dialog_${row_index}"
                                           class="uif-actionLink" tabindex="0"
                                           data-onclick="writeHiddenToForm(&quot;editLineItem&quot;, ${row_index}); showDialog(&quot;Workload-Capacity-Edit&quot;);"
                                           data-role="Action">
                                            Capacity/Flexibility
                                        </a>
                                    </li>
                                    <li>
                                        <a id="show_capacity_flexibility_dialog_${row_index}"
                                           class="uif-actionLink" tabindex="0"
                                           data-onclick="writeHiddenToForm(&quot;editLineItem&quot;, ${row_index}); showDialog(&quot;Workload-Unit-Edit&quot;);"
                                           data-role="Action">
                                            Unit Assignments
                                        </a>
                                    </li>
                                    <#if !KualiForm.simulationMode>
                                        <li>
                                            <a id="show_capacity_flexibility_dialog_${row_index}"
                                               class="uif-actionLink" tabindex="0"
                                               data-onclick="writeHiddenToForm(&quot;editLineItem&quot;, ${row_index}); showDialog(&quot;Workload-Absentee-Edit&quot;);"
                                               data-role="Action">
                                                Absent Tracker
                                            </a>
                                        </li>
                                    </#if>
                                </ul>
                            </div>
                       <#if KualiForm.canEdit>
                            <button id="delete_workload_${row_index}"
                                    class="btn btn-default btn-xs uif-action"
                                    data-submit_data="{&quot;methodToCall&quot;:&quot;deleteAdministrator&quot;, &quot;deleteLineItem&quot;: &quot;${row_index}&quot;}"
                                    data-refreshid="Workload-Table"
                                    data-role="Action">
                                Remove
                            </button>
                         </#if>
                        </div>
                    </td>

                    <td>
                        <#if row.currentlyAbsent>
                            <span style="color:#C00;font-size: 16px;padding-top: 3px;display: block;" class="icon-remove3"></span>
                        <#elseif (row.wlCapacity.capacity gt 0)>
                            <span class="label label-info">
                                ${row.wlCapacity.capacity}
                            </span>
                        <#else>
                            <span class="label label-default">
                                ${row.wlCapacity.capacity}
                            </span>
                        </#if>
                    </td>

                    <#list row.wlflexibilityList as cell>
                        <td id="wl-balance-vertical">
                            <#if cell.flexibility?? >
                                ${cell.flexibility}
                              </#if>
                        </td>
                    </#list>

                    <td>

                    </td>
                </tr>
                </#list>
            </tbody>
        </table>

    </div>
    </@krad.groupWrap>

</#macro>
