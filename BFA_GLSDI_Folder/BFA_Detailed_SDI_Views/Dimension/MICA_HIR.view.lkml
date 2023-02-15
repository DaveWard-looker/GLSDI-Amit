# The name of this view in Looker is MI MICA"

view: MICA_HIR{
  label: "MICA"
  derived_table: {
    sql:select * from  @{server_name_fire}.@{schema_name}.FOTC_RD_BFA_MI_FLAT_DIMENSIONS_LOOKER where dimension ='MI_MICA' ;;
   }



  dimension: description_0 {
    type: string
    description: "Top Level of Hierarchy Description"
    group_label: "Level 0"
    sql: ${TABLE}.description_0 ;;
    drill_fields: [description_1]
  }

  dimension: description_1 {
    description: "Level 1 of MICA Hierarchy Description"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.description_1 ;;
    drill_fields: [description_2]
  }

  dimension: description_2 {
    description: "Level 2 of MICA Hierarchy Description"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.description_2 ;;
    drill_fields: [description_3]
  }

  dimension: description_3 {
    description: "Level 3 of MICA Hierarchy Description"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.description_3 ;;
    drill_fields: [description_4]
  }

  dimension: description_4 {
    description: "Level 4 of MICA Hierarchy Description"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.description_4 ;;
    drill_fields: [description_5]
  }

  dimension: description_5 {
    description: "Level 5 of MICA Hierarchy Description"
    type: string
    group_label: "Level 5"
    sql: ${TABLE}.description_5 ;;
    drill_fields: [description_6]
  }

  dimension: description_6 {
    description: "Level 6 of MICA Hierarchy Description"
    type: string
    group_label: "Level 6"
    sql: ${TABLE}.description_6 ;;
    drill_fields: [description_7]
  }

  dimension: description_7 {
    description: "Level 7 of MICA Hierarchy Description"
    type: string
    group_label: "Level 7"
    sql: ${TABLE}.description_7 ;;
    drill_fields: [description_8]
  }

  dimension: description_8 {
    description: "Level 8 of MICA Hierarchy Description"
    type: string
    group_label: "Level 8"
    sql: ${TABLE}.description_8 ;;
    drill_fields: [description_9]
  }

  dimension: description_9 {
    description: "Level 9 of MICA Hierarchy Description"
    type: string
    group_label: "Level 9"
    sql: ${TABLE}.description_9 ;;
    drill_fields: [description_10]
  }


  dimension: description_10 {
    description: "Level 10 of MICA Hierarchy Description"
    type: string
    group_label: "Level-10"
    sql: ${TABLE}.description_10 ;;
    drill_fields: [description_11]
  }

  dimension: description_11 {
    description: "Level 11 of MICA Hierarchy Description"
    type: string
    group_label: "Level-11"
    sql: ${TABLE}.description_11 ;;
    drill_fields: [description_12]
  }

  dimension: description_12 {
    description: "Level 12 of MICA Hierarchy Description"
    type: string
    group_label: "Level-12"
    sql: ${TABLE}.description_12 ;;
    drill_fields: [description_13]
  }

  dimension: description_13 {
    description: "Level 13 of MICA Hierarchy Description"
    type: string
    group_label: "Level-13"
    sql: ${TABLE}.description_13 ;;
    drill_fields: [description_14]
  }

  dimension: description_14 {
    description: "Level 14 of MICA Hierarchy Description"
    type: string
    group_label: "Level-14"
    sql: ${TABLE}.description_14 ;;
    drill_fields: [description_15]
  }

  dimension: description_15 {
    description: "Level 15 of MICA15Hierarchy Description"
    type: string
    group_label: "Level-15"
    sql: ${TABLE}.description_15 ;;
    drill_fields: [leaf]
  }

  # dimension: description_16 {
  #   description: "Level 16 of MICA Hierarchy Description"
  #   type: string
  #   group_label: "Level-16"
  #   sql: ${TABLE}.description_16 ;;
  #   drill_fields: [drill_description_fields*]
  # }

  # dimension: description_17 {
  #   description: "Level 17 of MICA Hierarchy Description"
  #   type: string
  #   group_label: "Level-17"
  #   sql: ${TABLE}.description_17 ;;
  #   drill_fields: [drill_description_fields*]
  # }



  dimension: dimension {
    type: string
    hidden: yes
    sql: ${TABLE}.dimension ;;
  }


  dimension: level_0 {
    description: "Top Level of MICA Hierarchy"
    type: string
    group_label: "Level 0"
    sql: ${TABLE}.level_0 ;;
    drill_fields: [level_1]
  }

  dimension: level_1 {
    description: "Level 1 of MICA Hierarchy"
    type: string
    group_label: "Level 1"
    sql: ${TABLE}.level_1 ;;
    drill_fields: [level_2]
  }

  dimension: level_2 {
    description: "Level 2 of MICA Hierarchy"
    type: string
    group_label: "Level 2"
    sql: ${TABLE}.level_2 ;;
    drill_fields: [level_3]
  }

  dimension: level_3 {
    description: "Level 3 of MICA Hierarchy"
    type: string
    group_label: "Level 3"
    sql: ${TABLE}.level_3 ;;
    drill_fields: [level_4]
  }

  dimension: level_4 {
    description: "Level 4 of MICA Hierarchy"
    type: string
    group_label: "Level 4"
    sql: ${TABLE}.level_4 ;;
    drill_fields: [level_5]
  }

  dimension: level_5 {
    description: "Level 5 of MICA Hierarchy"
    type: string
    group_label: "Level 5"
    sql: ${TABLE}.level_5 ;;
    drill_fields: [level_6]
  }

  dimension: level_6 {
    description: "Level 6 of MICA Hierarchy"
    type: string
    group_label: "Level 6"
    sql: ${TABLE}.level_6 ;;
    drill_fields: [level_7]
  }

  dimension: level_7 {
    description: "Level 7 of MICA Hierarchy"
    type: string
    group_label: "Level 7"
    sql: ${TABLE}.level_7 ;;
    drill_fields: [level_8]
  }

  dimension: level_8 {
    description: "Level 8 of MICA Hierarchy"
    type: string
    group_label: "Level 8"
    sql: ${TABLE}.level_8 ;;
    drill_fields: [level_9]

  }

  dimension: level_9 {
    description: "Level 9 of MICA Hierarchy"
    type: string
    group_label: "Level 9"
    sql: ${TABLE}.level_9 ;;
    drill_fields: [level_10]
  }


  dimension: level_10 {
    description: "Level 10 of MICA Hierarchy"
    type: string
    group_label: "Level-10"
    sql: ${TABLE}.level_10 ;;
    drill_fields: [level_11]
  }

  dimension: level_11 {
    description: "Level 11 of MICA Hierarchy"
    type: string
    group_label: "Level-11"
    sql: ${TABLE}.level_11 ;;
    drill_fields: [level_12]
  }

  dimension: level_12 {
    description: "Level 12 of MICA Hierarchy"
    type: string
    group_label: "Level-12"
    sql: ${TABLE}.level_12 ;;
    drill_fields: [level_13]
  }

  dimension: level_13 {
    description: "Level 13 of MICA Hierarchy"
    type: string
    group_label: "Level-13"
    sql: ${TABLE}.level_13 ;;
    drill_fields: [level_14]
  }

  dimension: level_14 {
    description: "Level 14 of MICA Hierarchy"
    type: string
    group_label: "Level-14"
    sql: ${TABLE}.level_14 ;;
    drill_fields: [level_15]
  }

  dimension: level_15 {
    description: "Level 15 of MICA Hierarchy"
    type: string
    group_label: "Level-15"
    sql: ${TABLE}.level_15 ;;
    drill_fields: [leaf]
  }


  dimension: leaf {
    description: "Lowest Level of MICA Hierarchy"
    type: string
    primary_key: yes
    sql: ${TABLE}.code ;;
    drill_fields: [level_15]
  }



  dimension: MICA_search{
    label: "MICA Search"
    group_label: "Hierarchy Search"
    type: string
    primary_key: no
    sql: ${TABLE}.leaf_description ;;
   # drill_fields: [drill_description_fields*]
  }

  dimension: Level{
    label: "Level"
    group_label: "Hierarchy Search"
    type: string
    primary_key: no
    sql: concat("Level","-",${TABLE}.depth) ;;
   # drill_fields: [drill_description_fields*]
  }
  dimension: depth {
    type: string
    sql: ${TABLE}.depth ;;
  }

}
