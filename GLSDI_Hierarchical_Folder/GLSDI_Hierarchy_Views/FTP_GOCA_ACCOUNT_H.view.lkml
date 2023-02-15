view: FTP_GOCA_ACCOUNT_H {

  label: "FTP GOCA ACCOUNT"
  extension: required

  set: FTP_GOCA_ACCOUNT_description_fields {
    fields: [FTP_GOCA_ACCOUNT_leaf_description,FTP_GOCA_ACCOUNT_description_0,FTP_GOCA_ACCOUNT_description_1,
      FTP_GOCA_ACCOUNT_description_2,FTP_GOCA_ACCOUNT_description_3,FTP_GOCA_ACCOUNT_description_4,
      FTP_GOCA_ACCOUNT_description_5,FTP_GOCA_ACCOUNT_description_6,FTP_GOCA_ACCOUNT_description_7,
      FTP_GOCA_ACCOUNT_description_8,FTP_GOCA_ACCOUNT_description_9,FTP_GOCA_ACCOUNT_description_10,FTP_GOCA_ACCOUNT_description_11
      ,FTP_GOCA_ACCOUNT_description_12,FTP_GOCA_ACCOUNT_description_13,FTP_GOCA_ACCOUNT_description_14,FTP_GOCA_ACCOUNT_description_15
    ]}

  set: FTP_GOCA_ACCOUNT_level_fields {
    fields: [FTP_GOCA_ACCOUNT_leaf,FTP_GOCA_ACCOUNT_level_0,FTP_GOCA_ACCOUNT_level_1,
      FTP_GOCA_ACCOUNT_level_2,FTP_GOCA_ACCOUNT_level_3,FTP_GOCA_ACCOUNT_level_4,FTP_GOCA_ACCOUNT_level_5,
      FTP_GOCA_ACCOUNT_level_6,FTP_GOCA_ACCOUNT_level_7,FTP_GOCA_ACCOUNT_level_8,FTP_GOCA_ACCOUNT_level_9,FTP_GOCA_ACCOUNT_level_10,
      FTP_GOCA_ACCOUNT_level_11,FTP_GOCA_ACCOUNT_level_12,FTP_GOCA_ACCOUNT_level_13,FTP_GOCA_ACCOUNT_level_14,FTP_GOCA_ACCOUNT_level_15]
  }

  dimension: FTP_GOCA_ACCOUNT_description_0 {
    label: "Description 0"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_0} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_0 {
    label: "Level 0"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 0"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_0} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }


  dimension: FTP_GOCA_ACCOUNT_description_1 {
    label: "Description 1"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_1} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_1 {
    label: "Level 1"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 1"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_1} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }


  dimension: FTP_GOCA_ACCOUNT_description_2 {
    label: "Description 2"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_2} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_2 {
    label: "Level 2"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 2"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_2} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_description_3 {
    label: "Description 3"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_3} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_3 {
    label: "Level 3"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 3"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_3} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_description_4 {
    label: "Description 4"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_4} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_4 {
    label: "Level 4"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 4"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_4} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }
  dimension: FTP_GOCA_ACCOUNT_description_5 {
    label: "Description 5"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_5} end;;
  }

  dimension: FTP_GOCA_ACCOUNT_level_5 {
    label: "Level 5"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 5"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_5} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }
  dimension: FTP_GOCA_ACCOUNT_description_6 {
    label: "Description 6"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_6} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_6 {
    label: "Level 6"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 6"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_6} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }
  dimension: FTP_GOCA_ACCOUNT_description_7 {
    label: "Description 7"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_7} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_7 {
    label: "Level 7"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 7"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_7} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }
  dimension: FTP_GOCA_ACCOUNT_description_8 {
    label: "Description 8"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 8"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_8} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_8 {
    label: "Level 8"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 8"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_8} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_description_9 {
    label: "Description 9"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 9"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_9} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_9 {
    label: "Level 9"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level 9"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_9} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }


  dimension: FTP_GOCA_ACCOUNT_description_10 {
    label: "Description 10"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-10"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_10} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_10 {
    label: "Level 10"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-10"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_10} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }


  dimension: FTP_GOCA_ACCOUNT_description_11 {
    label: "Description 11"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-11"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_11} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_11 {
    label: "Level 11"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-11"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_11} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }
  dimension: FTP_GOCA_ACCOUNT_description_12 {
    label: "Description 12"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-12"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_12} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_12 {
    label: "Level 12"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-12"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_12} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }
  dimension: FTP_GOCA_ACCOUNT_description_13 {
    label: "Description 13"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-13"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_13} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_13 {
    label: "Level 13"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-13"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_13} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }
  dimension: FTP_GOCA_ACCOUNT_description_14 {
    label: "Description 14"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-14"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_14} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_14 {
    label: "Level 14"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-14"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_14} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }
  dimension: FTP_GOCA_ACCOUNT_description_15 {
    label: "Description 15"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-15"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${description_15} end;;
    drill_fields: [FTP_GOCA_ACCOUNT_description_fields*]
  }

  dimension: FTP_GOCA_ACCOUNT_level_15 {
    label: "Level 15"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Level-15"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${level_15} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]
  }


  dimension: FTP_GOCA_ACCOUNT_leaf {
    label: "Leaf"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Leaf"
    type: string
    #primary_key: yes
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${code} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]

  }

  dimension: FTP_GOCA_ACCOUNT_leaf_description {
    label: "Leaf Description"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Leaf"
    type: string
    # primary_key: yes
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then  ${leaf_description} end ;;
    drill_fields: [FTP_GOCA_ACCOUNT_level_fields*]

  }

  dimension: FTP_GOCA_ACCOUNT_depth {
    label: "Depth"
    view_label: "FTP GOCA ACCOUNT"
    #group_label: "Hierarchy Search"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${depth} end;;

  }

  dimension: FTP_GOCA_ACCOUNT_Level{
    label: "Level"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Hierarchy Search"
    type: string
    sql:  concat('Level',"-",${FTP_GOCA_ACCOUNT_depth}) ;;

  }

  dimension: FTP_GOCA_ACCOUNT_description_search{
    # label: "Level"
    view_label: "FTP GOCA ACCOUNT"
    group_label: "Hierarchy Search"
    type: string
    sql: case when ${dimension}="FTP_GOCA_ACCOUNT" then ${leaf_description} end;;

  }



}
