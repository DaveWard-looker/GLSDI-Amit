# Added by Jim for C10 requirement on 7Feb2023
# The name of this view in Looker is "Fotc Dp Bfa Balance Traceability Dashboard Mica Mtd"
view: fotc_dp_bfa_balance_traceability_dashboard_mica_mtd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: @{server_name_fine}.@{schema_name}.FOTC_DP_BFA_BALANCE_TRACEABILITY_DASHBOARD_MICA_MTD
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Accounting Regulation Code" in Explore.

  dimension: accounting_regulation_code {
    type: string
    sql: ${TABLE}.accounting_regulation_code ;;
  }

  dimension: allocation_repair_mtd {
    type: number
    sql: ${TABLE}.allocation_repair_mtd ;;
  }

  dimension: automated_repair_balance_type_mtd {
    type: number
    sql: ${TABLE}.automated_repair_balance_type_mtd ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_automated_repair_balance_type_mtd {
    type: sum
    sql: ${automated_repair_balance_type_mtd} ;;
  }

  measure: average_automated_repair_balance_type_mtd {
    type: average
    sql: ${automated_repair_balance_type_mtd} ;;
  }

  dimension: calculated_final_standardised_gl_detail_sdi_mtd_excl_corp {
    type: number
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_excl_corp ;;
  }

  dimension: calculated_final_standardised_gl_detail_sdi_mtd_incl_corp {
    type: number
    sql: ${TABLE}.calculated_final_standardised_gl_detail_sdi_mtd_incl_corp ;;
  }

  dimension: corp_re_segmentation_mtd {
    type: number
    sql: ${TABLE}.corp_re_segmentation_mtd ;;
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

  dimension: final_standardised_gl_detail_sdi_mtd {
    type: number
    sql: ${TABLE}.final_standardised_gl_detail_sdi_mtd ;;
  }

  dimension: gl_detail_sdi_balance_type_mtd {
    type: number
    sql: ${TABLE}.gl_detail_sdi_balance_type_mtd ;;
  }

  dimension: grca_phase_3_mapping_mtd {
    type: number
    sql: ${TABLE}.grca_phase_3_mapping_mtd ;;
  }

  dimension: justified_desciprtion_mica {
    type: string
    sql: ${TABLE}.justified_desciprtion_mica ;;
  }

  dimension: legal_entity {
    type: string
    sql: ${TABLE}.legal_entity ;;
  }

  dimension: mi_allocation_balance_type_mtd {
    type: number
    sql: ${TABLE}.mi_allocation_balance_type_mtd ;;
  }

  dimension: mi_function_code {
    type: string
    sql: ${TABLE}.mi_function_code ;;
  }

  dimension: mi_global_business {
    type: string
    sql: ${TABLE}.mi_global_business ;;
  }

  dimension: mi_manual_adjustment_balance_type_mtd {
    type: number
    sql: ${TABLE}.mi_manual_adjustment_balance_type_mtd ;;
  }

  dimension: mica_level_x {
    type: string
    sql: ${TABLE}.mica_level_x ;;
  }

  dimension: nominal_account_number {
    type: string
    sql: ${TABLE}.nominal_account_number ;;
  }

  dimension: other_mtd {
    type: number
    sql: ${TABLE}.other_mtd ;;
  }

  dimension: parent_level_x_mica {
    type: string
    sql: ${TABLE}.parent_level_x_mica ;;
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

  dimension: sort_order {
    type: number
    sql: ${TABLE}.sort_order ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
