view: cc_function {
  label: "Function"
  derived_table: {
    sql: select * from  DISCOVERY.FOTC_RD_BFA_MI_COMBINED_DIMENSIONS where dimension ='MI_FUNCTION' ;;
    persist_for: "9000 hours"
  }
  dimension: dimension  {
    type: string
    sql: ${TABLE}.dimension ;;
  }

  dimension: group_code  {
    #label: "MICA Group Code"
    type: string
    sql: ${TABLE}.group_code ;;
    # link: {
    #   label: "Parent Code"
    #   url: "/explore/BFA_SDI_Data_Discovery_R3/fotc_dp_ce_gl_detail_output_current_period_all?fields=cc_mica.group_code,cc_mica.parent_code,cc_mica.child_code&f[fotc_dp_ce_gl_detail_output_current_period_all.format]=M&f[cc_mica.parent_code]={{value | url_encode}}&sorts=cc_mica.group_code&limit=500"
    # }
    # link: {
    #   label: "Child Code"
    #   url: "/explore/BFA_SDI_Data_Discovery_R3/fotc_dp_ce_gl_detail_output_current_period_all?fields=cc_mica.group_code,cc_mica.parent_code,cc_mica.child_code&f[fotc_dp_ce_gl_detail_output_current_period_all.format]=M&f[cc_mica.child_code]={{value | url_encode}}&sorts=cc_mica.group_code&limit=500"
    # }
    drill_fields: [parent_code,child_code,leaf_code]

  }

  dimension: group_description {
    type: string
    sql: ${TABLE}.group_description ;;
    drill_fields: [leaf_description]
  }

  measure: group_index{
    type: max
    sql: ${TABLE}.group_index ;;
    value_format: "###0"
  }

  dimension: parent_code {
    type: string
    sql: ${TABLE}.parent_code;;
    drill_fields: [group_code,child_code,leaf_code]
  }

  dimension: child_code {
    type: string
    sql: ${TABLE}.child_code;;
    drill_fields: [group_code,parent_code,leaf_code]
  }

  dimension: leaf_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.leaf_code ;;
    drill_fields: [group_code,parent_code,child_code]
  }

  dimension: leaf_description {
    type: string
    sql: ${TABLE}.leaf_description ;;
    drill_fields: [group_description]

  }

  measure: leaf_index {
    type: max
    sql: ${TABLE}.leaf_index ;;
    value_format: "###0"
  }

}
