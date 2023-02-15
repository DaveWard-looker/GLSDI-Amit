# Added by Jim for C10 requirement on 7Feb2023
# The name of this view in Looker is "Fotc Dp Bfa Balance Traceability Dashboard Grca Mtd"
view: fotc_dp_bfa_balance_traceability_dashboard_grca_mtd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: @{server_name_fine}.@{schema_name}.FOTC_DP_BFA_BALANCE_TRACEABILITY_DASHBOARD_GRCA_MTD
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Accounting Regulation Code" in Explore.

  parameter: format {
    type: string
    hidden: yes
    allowed_value: {
      label: "Millions"
      value: "M"
    }
    allowed_value: {
      label: "Thousands"
      value: "K"
    }
    allowed_value: {
      label: "Billions"
      value: "B"
    }

    allowed_value: {
      label: "ALL"
      value: "X"
    }
  }

  dimension: justified_description_mica {
    label: "MICA Code & Description"
    type: string
    sql: ${TABLE}.justified_description_mica ;;
  }

  dimension: accounting_regulation_code {
    type: string
    sql: ${TABLE}.accounting_regulation_code ;;
  }

  measure: allocation_repair_mtd {
    label: "Allocation Repair"
    type: sum
    sql: ${TABLE}.allocation_repair_mtd ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{allocation_repair_mtd_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{allocation_repair_mtd_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{allocation_repair_mtd_b._linked_value}}
          {% else %}
          {{allocation_repair_mtd_all._linked_value}}
          {% endif %}
          ;;
  }

    measure: allocation_repair_mtd_b {
      label: "Allocation Repair"
      type: sum
      hidden: yes
      sql: ${TABLE}.allocation_repair_mtd ;;
      value_format: "#,##0.00,,,\" \""
    }


    measure: allocation_repair_mtd_m {
      label: "Allocation Repair"
      hidden: yes
      type: sum
      sql: ${TABLE}.allocation_repair_mtd ;;
      value_format: "#,##0.00,,\" \""
    }


    measure: allocation_repair_mtd_k {
      label: "Allocation Repair"
      hidden: yes
      type: sum
      sql: ${TABLE}.allocation_repair_mtd ;;
      value_format: "#,##0.00,\" \""
    }

    measure: allocation_repair_mtd_all {
      label: "Allocation Repair"
      hidden: yes
      type: sum
      sql: ${TABLE}.allocation_repair_mtd ;;
      value_format: "#,##0.00"
    }

  measure: automated_repair_balance_type_mtd {
    label: "Automated Repair"
    type: sum
    sql: ${TABLE}.automated_repair_balance_type_mtd ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{automated_repair_balance_type_mtd_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{automated_repair_balance_type_mtd_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{automated_repair_balance_type_mtd_b._linked_value}}
          {% else %}
          {{automated_repair_balance_type_mtd_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: automated_repair_balance_type_mtd_b {
    label: "Automated Repair"
    type: sum
    hidden: yes
    sql: ${TABLE}.automated_repair_balance_type_mtd ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: automated_repair_balance_type_mtd_m {
    label: "Automated Repair"
    hidden: yes
    type: sum
    sql: ${TABLE}.automated_repair_balance_type_mtd ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: automated_repair_balance_type_mtd_k {
    label: "Automated Repair"
    hidden: yes
    type: sum
    sql: ${TABLE}.automated_repair_balance_type_mtd ;;
    value_format: "#,##0.00,\" \""
  }

  measure: automated_repair_balance_type_mtd_all {
    label: "Automated Repair"
    hidden: yes
    type: sum
    sql: ${TABLE}.automated_repair_balance_type_mtd ;;
    value_format: "#,##0.00"
  }

  measure: calculated_final_standardised_gl_detail_sdi_mtd_excl_corp {
    label: "Calculated Final Standardised GL Detail SDI (excluding Corp Re-segmentation)"
    type: sum
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_excl_corp ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{calculated_final_standardised_gl_detail_sdi_mtd_excl_corp_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{calculated_final_standardised_gl_detail_sdi_mtd_excl_corp_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{calculated_final_standardised_gl_detail_sdi_mtd_excl_corp_b._linked_value}}
          {% else %}
          {{calculated_final_standardised_gl_detail_sdi_mtd_excl_corp_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: calculated_final_standardised_gl_detail_sdi_mtd_excl_corp_b {
    label: "Calculated Final Standardised GL Detail SDI (excluding Corp Re-segmentation)"
    type: sum
    hidden: yes
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_excl_corp ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: calculated_final_standardised_gl_detail_sdi_mtd_excl_corp_m {
    label: "Calculated Final Standardised GL Detail SDI (excluding Corp Re-segmentation)"
    hidden: yes
    type: sum
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_excl_corp ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: calculated_final_standardised_gl_detail_sdi_mtd_excl_corp_k {
    label: "Calculated Final Standardised GL Detail SDI (excluding Corp Re-segmentation)"
    hidden: yes
    type: sum
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_excl_corp ;;
    value_format: "#,##0.00,\" \""
  }

  measure: calculated_final_standardised_gl_detail_sdi_mtd_excl_corp_all {
    label: "Calculated Final Standardised GL Detail SDI (excluding Corp Re-segmentation)"
    hidden: yes
    type: sum
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_excl_corp ;;
    value_format: "#,##0.00"
  }

  measure: calculated_final_standardised_gl_detail_sdi_mtd_incl_corp {
    label: "Calculated Final Standardised GL Detail SDI (including Corp Re-segmentation)"
    type: sum
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_incl_corp ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{calculated_final_standardised_gl_detail_sdi_mtd_incl_corp_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{calculated_final_standardised_gl_detail_sdi_mtd_incl_corp_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{calculated_final_standardised_gl_detail_sdi_mtd_incl_corp_b._linked_value}}
          {% else %}
          {{calculated_final_standardised_gl_detail_sdi_mtd_incl_corp_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: calculated_final_standardised_gl_detail_sdi_mtd_incl_corp_b {
    label: "Calculated Final Standardised GL Detail SDI (including Corp Re-segmentation)"
    type: sum
    hidden: yes
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_incl_corp ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: calculated_final_standardised_gl_detail_sdi_mtd_incl_corp_m {
    label: "Calculated Final Standardised GL Detail SDI (including Corp Re-segmentation)"
    hidden: yes
    type: sum
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_incl_corp ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: calculated_final_standardised_gl_detail_sdi_mtd_incl_corp_k {
    label: "Calculated Final Standardised GL Detail SDI (including Corp Re-segmentation)"
    hidden: yes
    type: sum
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_incl_corp ;;
    value_format: "#,##0.00,\" \""
  }

  measure: calculated_final_standardised_gl_detail_sdi_mtd_incl_corp_all {
    label: "Calculated Final Standardised GL Detail SDI (including Corp Re-segmentation)"
    hidden: yes
    type: sum
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_incl_corp ;;
    value_format: "#,##0.00"
  }

  measure: corp_re_segmentation_mtd {
    label: "Corp Re-segmentation"
    type: sum
    sql: ${TABLE}.corp_re_segmentation_mtd ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{corp_re_segmentation_mtd_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{corp_re_segmentation_mtd_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{corp_re_segmentation_mtd_b._linked_value}}
          {% else %}
          {{corp_re_segmentation_mtd_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: corp_re_segmentation_mtd_b {
    label: "Corp Re-segmentation"
    type: sum
    hidden: yes
    sql: ${TABLE}.corp_re_segmentation_mtd ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: corp_re_segmentation_mtd_m {
    label: "Corp Re-segmentation"
    hidden: yes
    type: sum
    sql: ${TABLE}.corp_re_segmentation_mtd ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: corp_re_segmentation_mtd_k {
    label: "Corp Re-segmentation"
    hidden: yes
    type: sum
    sql: ${TABLE}.corp_re_segmentation_mtd ;;
    value_format: "#,##0.00,\" \""
  }

  measure: corp_re_segmentation_mtd_all {
    label: "Corp Re-segmentation"
    hidden: yes
    type: sum
    sql: ${TABLE}.corp_re_segmentation_mtd ;;
    value_format: "#,##0.00"
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_time_stamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.date_time_stamp ;;
  }

  dimension: difference_mtd {
    type: number
    sql: ${TABLE}.difference_mtd ;;
  }

  measure: final_standardised_gl_detail_sdi_mtd {
    label: "Final Standardised GL Detail SDI"
    type: sum
    sql: ${TABLE}.final_standardised_gl_detail_sdi_mtd ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{final_standardised_gl_detail_sdi_mtd_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{final_standardised_gl_detail_sdi_mtd_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{final_standardised_gl_detail_sdi_mtd_b._linked_value}}
          {% else %}
          {{final_standardised_gl_detail_sdi_mtd_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: final_standardised_gl_detail_sdi_mtd_b {
    label: "Final Standardised GL Detail SDI"
    type: sum
    hidden: yes
    sql: ${TABLE}.final_standardised_gl_detail_sdi_mtd ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: final_standardised_gl_detail_sdi_mtd_m {
    label: "Final Standardised GL Detail SDI"
    hidden: yes
    type: sum
    sql: ${TABLE}.final_standardised_gl_detail_sdi_mtd ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: final_standardised_gl_detail_sdi_mtd_k {
    label: "Final Standardised GL Detail SDI"
    hidden: yes
    type: sum
    sql: ${TABLE}.final_standardised_gl_detail_sdi_mtd ;;
    value_format: "#,##0.00,\" \""
  }

  measure: final_standardised_gl_detail_sdi_mtd_all {
    label: "Final Standardised GL Detail SDI"
    hidden: yes
    type: sum
    sql: ${TABLE}.final_standardised_gl_detail_sdi_mtd ;;
    value_format: "#,##0.00"
  }

  measure: gl_detail_sdi_balance_type_mtd {
    label: "GL Detailed SDI (Source balance, repaired M&S cost centres)"
    type: sum
    sql: ${TABLE}.gl_detail_sdi_balance_type_mtd ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{gl_detail_sdi_balance_type_mtd_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{gl_detail_sdi_balance_type_mtd_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{gl_detail_sdi_balance_type_mtd_b._linked_value}}
          {% else %}
          {{gl_detail_sdi_balance_type_mtd_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: gl_detail_sdi_balance_type_mtd_b {
    label: "GL Detailed SDI (Source balance, repaired M&S cost centres)"
    type: sum
    hidden: yes
    sql: ${TABLE}.gl_detail_sdi_balance_type_mtd ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: gl_detail_sdi_balance_type_mtd_m {
    label: "GL Detailed SDI (Source balance, repaired M&S cost centres)"
    hidden: yes
    type: sum
    sql: ${TABLE}.gl_detail_sdi_balance_type_mtd ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: gl_detail_sdi_balance_type_mtd_k {
    label: "GL Detailed SDI (Source balance, repaired M&S cost centres)"
    hidden: yes
    type: sum
    sql: ${TABLE}.gl_detail_sdi_balance_type_mtd ;;
    value_format: "#,##0.00,\" \""
  }

  measure: gl_detail_sdi_balance_type_mtd_all {
    label: "GL Detailed SDI (Source balance, repaired M&S cost centres)"
    hidden: yes
    type: sum
    sql: ${TABLE}.gl_detail_sdi_balance_type_mtd ;;
    value_format: "#,##0.00"
  }

  dimension: grca_level_x {
    type: string
    sql: ${TABLE}.grca_level_x ;;
  }

  measure: grca_phase_3_mapping_mtd {
    label: "GRCA Phase 3 Mapping"
    type: sum
    sql: ${TABLE}.grca_phase_3_mapping_mtd ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{grca_phase_3_mapping_mtd_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{grca_phase_3_mapping_mtd_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{grca_phase_3_mapping_mtd_b._linked_value}}
          {% else %}
          {{grca_phase_3_mapping_mtd_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: grca_phase_3_mapping_mtd_b {
    label: "GRCA Phase 3 Mapping"
    type: sum
    hidden: yes
    sql: ${TABLE}.grca_phase_3_mapping_mtd ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: grca_phase_3_mapping_mtd_m {
    label: "GRCA Phase 3 Mapping"
    hidden: yes
    type: sum
    sql: ${TABLE}.grca_phase_3_mapping_mtd ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: grca_phase_3_mapping_mtd_k {
    label: "GRCA Phase 3 Mapping"
    hidden: yes
    type: sum
    sql: ${TABLE}.grca_phase_3_mapping_mtd ;;
    value_format: "#,##0.00,\" \""
  }

  measure: grca_phase_3_mapping_mtd_all {
    label: "GRCA Phase 3 Mapping"
    hidden: yes
    type: sum
    sql: ${TABLE}.grca_phase_3_mapping_mtd ;;
    value_format: "#,##0.00"
  }

  dimension: justified_desciprtion_grca {
    type: string
    sql: ${TABLE}.justified_desciprtion_grca ;;
  }

  dimension: legal_entity {
    type: string
    sql: ${TABLE}.legal_entity ;;
  }

  measure: mi_allocation_balance_type_mtd {
    label: "MI Allocation"
    type: sum
    sql: ${TABLE}.mi_allocation_balance_type_mtd ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{mi_allocation_balance_type_mtd_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{mi_allocation_balance_type_mtd_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{mi_allocation_balance_type_mtd_b._linked_value}}
          {% else %}
          {{mi_allocation_balance_type_mtd_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: mi_allocation_balance_type_mtd_b {
    label: "MI Allocation"
    type: sum
    hidden: yes
    sql: ${TABLE}.mi_allocation_balance_type_mtd ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: mi_allocation_balance_type_mtd_m {
    label: "MI Allocation"
    hidden: yes
    type: sum
    sql: ${TABLE}.mi_allocation_balance_type_mtd ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: mi_allocation_balance_type_mtd_k {
    label: "MI Allocation"
    hidden: yes
    type: sum
    sql: ${TABLE}.mi_allocation_balance_type_mtd ;;
    value_format: "#,##0.00,\" \""
  }

  measure: mi_allocation_balance_type_mtd_all {
    label: "MI Allocation"
    hidden: yes
    type: sum
    sql: ${TABLE}.mi_allocation_balance_type_mtd ;;
    value_format: "#,##0.00"
  }

  dimension: mi_function_code {
    type: string
    sql: ${TABLE}.mi_function_code ;;
  }

  dimension: mi_global_business {
    type: string
    sql: ${TABLE}.mi_global_business ;;
  }

  measure: mi_manual_adjustment_balance_type_mtd {
    label: "MI Manual Adjustment"
    type: sum
    sql: ${TABLE}.mi_manual_adjustment_balance_type_mtd ;;
    value_format: "###0.00"
    html: {% if format._parameter_value == "'M'" %}
          {{mi_manual_adjustment_balance_type_mtd_m._linked_value}}
          {% elsif format._parameter_value == "'K'" %}
          {{mi_manual_adjustment_balance_type_mtd_k._linked_value}}
          {% elsif format._parameter_value == "'B'" %}
          {{mi_manual_adjustment_balance_type_mtd_b._linked_value}}
          {% else %}
          {{mi_manual_adjustment_balance_type_mtd_all._linked_value}}
          {% endif %}
          ;;
  }

  measure: mi_manual_adjustment_balance_type_mtd_b {
    label: "MI Manual Adjustment"
    type: sum
    hidden: yes
    sql: ${TABLE}.mi_manual_adjustment_balance_type_mtd ;;
    value_format: "#,##0.00,,,\" \""
  }


  measure: mi_manual_adjustment_balance_type_mtd_m {
    label: "MI Manual Adjustment"
    hidden: yes
    type: sum
    sql: ${TABLE}.mi_manual_adjustment_balance_type_mtd ;;
    value_format: "#,##0.00,,\" \""
  }


  measure: mi_manual_adjustment_balance_type_mtd_k {
    label: "MI Manual Adjustment"
    hidden: yes
    type: sum
    sql: ${TABLE}.mi_manual_adjustment_balance_type_mtd ;;
    value_format: "#,##0.00,\" \""
  }

  measure: mi_manual_adjustment_balance_type_mtd_all {
    label: "MI Manual Adjustment"
    hidden: yes
    type: sum
    sql: ${TABLE}.mi_manual_adjustment_balance_type_mtd ;;
    value_format: "#,##0.00"
  }

  dimension: nominal_account_number {
    type: string
    sql: ${TABLE}.nominal_account_number ;;
  }

  dimension: other_mtd {
    type: number
    sql: ${TABLE}.other_mtd ;;
  }

  dimension: parent_level_x_grca {
    type: string
    sql: ${TABLE}.parent_level_x_grca ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension_group: reporting_period {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.reporting_period ;;
  }

  dimension: run_uuid {
    type: string
    sql: ${TABLE}.run_uuid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
