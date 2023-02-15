view: cc_mica {
  label: "MICA"
  derived_table: {
 sql: select * from  DISCOVERY.FOTC_RD_BFA_MI_COMBINED_DIMENSIONS where dimension='MI_MICA' ;;
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
    drill_fields: [parent_code,child_code,leaf_code
      ,MICA_HIR.level_0,MICA_HIR.level_2,MICA_HIR.level_3
      ,MICA_HIR.level_4,MICA_HIR.level_5,MICA_HIR.level_6
      ,MICA_HIR.level_7,MICA_HIR.level_8,MICA_HIR.level_9
      ,MICA_HIR.level_10,MICA_HIR.level_11,MICA_HIR.level_12
      ,MICA_HIR.level_13,MICA_HIR.level_14,MICA_HIR.level_15
      ]

  }

  dimension: group_description {
    type: string
    sql: ${TABLE}.group_description ;;
    drill_fields: [parent_code,child_code,leaf_description
      ,MICA_HIR.description_0,MICA_HIR.description_2,MICA_HIR.description_3
      ,MICA_HIR.description_4,MICA_HIR.description_5,MICA_HIR.description_6
      ,MICA_HIR.description_7,MICA_HIR.description_8,MICA_HIR.description_9
      ,MICA_HIR.description_10,MICA_HIR.description_11,MICA_HIR.description_12
      ,MICA_HIR.description_13,MICA_HIR.description_14,MICA_HIR.description_15
    ]
  }

  dimension: drill_depth {
    type: string
    sql:  case when ${group_code}=${MICA_HIR.level_0} then 'Depth 0'
               when ${group_code}=${MICA_HIR.level_1} then 'Depth 1'
               when ${group_code}=${MICA_HIR.level_2} then 'Depth 2'
               when ${group_code}=${MICA_HIR.level_3} then 'Depth 3'
               when ${group_code}=${MICA_HIR.level_4} then 'Depth 4'
               when ${group_code}=${MICA_HIR.level_5} then 'Depth 5'
               when ${group_code}=${MICA_HIR.level_6} then 'Depth 6'
               when ${group_code}=${MICA_HIR.level_7} then 'Depth 7'
               when ${group_code}=${MICA_HIR.level_8} then 'Depth 8'
               when ${group_code}=${MICA_HIR.level_9} then 'Depth 9'
               when ${group_code}=${MICA_HIR.level_10} then 'Depth_10'
               when ${group_code}=${MICA_HIR.level_11} then 'Depth_11'
               when ${group_code}=${MICA_HIR.level_12} then 'Depth_12'
               when ${group_code}=${MICA_HIR.level_13} then 'Depth_13'
               when ${group_code}=${MICA_HIR.level_14} then 'Depth_14'
               when ${group_code}=${MICA_HIR.level_15} then 'Depth_15'
              else 'leaf'

              end;;

  }

  measure: group_index{
    type: max
    sql: ${TABLE}.group_index ;;
    value_format: "###0"
  }

  dimension: parent_code {
    type: string
    sql: ${TABLE}.parent_code;;
    drill_fields: [group_code,child_code,leaf_code,MICA_HIR.description_0]
  }

  dimension: child_code {
    type: string
    sql: ${TABLE}.child_code;;
    drill_fields: [group_code,parent_code,leaf_code,MICA_HIR.description_0]
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
