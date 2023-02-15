view: mi_entity_h {
    label: "MI ENTITY"
    extension: required

    set: MI_ENTITY_description_fields {
      fields: [MI_ENTITY_leaf_description,MI_ENTITY_description_0,MI_ENTITY_description_1,
        MI_ENTITY_description_2,MI_ENTITY_description_3,MI_ENTITY_description_4,
        MI_ENTITY_description_5,MI_ENTITY_description_6,MI_ENTITY_description_7,
        MI_ENTITY_description_8,MI_ENTITY_description_9,MI_ENTITY_description_10,MI_ENTITY_description_11
        ,MI_ENTITY_description_12,MI_ENTITY_description_13]}

    set: MI_ENTITY_level_fields {
      fields: [MI_ENTITY_leaf,MI_ENTITY_level_0,MI_ENTITY_level_1,
        MI_ENTITY_level_2,MI_ENTITY_level_3,MI_ENTITY_level_4,MI_ENTITY_level_5,
        MI_ENTITY_level_6,MI_ENTITY_level_7,MI_ENTITY_level_8,MI_ENTITY_level_9,MI_ENTITY_level_10,
        MI_ENTITY_level_11,MI_ENTITY_level_12,MI_ENTITY_level_13]
    }

    dimension: MI_ENTITY_description_0 {
      label: "Description 0"
      view_label: "MI ENTITY"
      group_label: "Level 0"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_0} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_0 {
      label: "Level 0"
      view_label: "MI ENTITY"
      group_label: "Level 0"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_0} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }


    dimension: MI_ENTITY_description_1 {
      label: "Description 1"
      view_label: "MI ENTITY"
      group_label: "Level 1"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_1} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_1 {
      label: "Level 1"
      view_label: "MI ENTITY"
      group_label: "Level 1"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_1} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }


    dimension: MI_ENTITY_description_2 {
      label: "Description 2"
      view_label: "MI ENTITY"
      group_label: "Level 2"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_2} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_2 {
      label: "Level 2"
      view_label: "MI ENTITY"
      group_label: "Level 2"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_2} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }

    dimension: MI_ENTITY_description_3 {
      label: "Description 3"
      view_label: "MI ENTITY"
      group_label: "Level 3"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_3} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_3 {
      label: "Level 3"
      view_label: "MI ENTITY"
      group_label: "Level 3"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_3} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }

    dimension: MI_ENTITY_description_4 {
      label: "Description 4"
      view_label: "MI ENTITY"
      group_label: "Level 4"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_4} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_4 {
      label: "Level 4"
      view_label: "MI ENTITY"
      group_label: "Level 4"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_4} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }
    dimension: MI_ENTITY_description_5 {
      label: "Description 5"
      view_label: "MI ENTITY"
      group_label: "Level 5"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_5} end;;
    }

    dimension: MI_ENTITY_level_5 {
      label: "Level 5"
      view_label: "MI ENTITY"
      group_label: "Level 5"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_5} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }
    dimension: MI_ENTITY_description_6 {
      label: "Description 6"
      view_label: "MI ENTITY"
      group_label: "Level 6"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_6} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_6 {
      label: "Level 6"
      view_label: "MI ENTITY"
      group_label: "Level 6"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_6} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }
    dimension: MI_ENTITY_description_7 {
      label: "Description 7"
      view_label: "MI ENTITY"
      group_label: "Level 7"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_7} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_7 {
      label: "Level 7"
      view_label: "MI ENTITY"
      group_label: "Level 7"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_7} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }
    dimension: MI_ENTITY_description_8 {
      label: "Description 8"
      view_label: "MI ENTITY"
      group_label: "Level 8"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_8} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_8 {
      label: "Level 8"
      view_label: "MI ENTITY"
      group_label: "Level 8"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_8} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }

    dimension: MI_ENTITY_description_9 {
      label: "Description 9"
      view_label: "MI ENTITY"
      group_label: "Level 9"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_9} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_9 {
      label: "Level 9"
      view_label: "MI ENTITY"
      group_label: "Level 9"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_9} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }


    dimension: MI_ENTITY_description_10 {
      label: "Description 10"
      view_label: "MI ENTITY"
      group_label: "Level-10"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_10} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_10 {
      label: "Level 10"
      view_label: "MI ENTITY"
      group_label: "Level-10"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_10} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }


    dimension: MI_ENTITY_description_11 {
      label: "Description 11"
      view_label: "MI ENTITY"
      group_label: "Level-11"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_11} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_11 {
      label: "Level 11"
      view_label: "MI ENTITY"
      group_label: "Level-11"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_11} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }
    dimension: MI_ENTITY_description_12 {
      label: "Description 12"
      view_label: "MI ENTITY"
      group_label: "Level-12"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_12} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_12 {
      label: "Level 12"
      view_label: "MI ENTITY"
      group_label: "Level-12"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_12} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }
    dimension: MI_ENTITY_description_13 {
      label: "Description 13"
      view_label: "MI ENTITY"
      group_label: "Level-13"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${description_13} end;;
      drill_fields: [MI_ENTITY_description_fields*]
    }

    dimension: MI_ENTITY_level_13 {
      label: "Level 13"
      view_label: "MI ENTITY"
      group_label: "Level-13"
      type: string
      sql: case when ${dimension}="MI_ENTITY" then ${level_13} end ;;
      drill_fields: [MI_ENTITY_level_fields*]
    }


    dimension: MI_ENTITY_leaf {
      label: "Leaf"
      view_label: "MI ENTITY"
      group_label: "Leaf"
      type: string
      #primary_key: yes
      sql: case when ${dimension}="MI_ENTITY" then ${code} end ;;
      drill_fields: [MI_ENTITY_level_fields*]

    }

    dimension: MI_ENTITY_leaf_description {
      label: "Leaf Description"
      view_label: "MI ENTITY"
      group_label: "Leaf"
      type: string
      # primary_key: yes
      sql: case when ${dimension}="MI_ENTITY" then  ${leaf_description} end ;;
      drill_fields: [MI_ENTITY_level_fields*]

    }

  dimension: MI_ENTITY_depth {
    label: "Depth"
    view_label: "MI ENTITY"
    #group_label: "Hierarchy Search"
    type: string
    sql: case when ${dimension}="MI_ENTITY" then ${depth} end;;

  }

  dimension: MI_ENTITY_Level{
    label: "Level"
    view_label: "MI ENTITY"
    group_label: "Hierarchy Search"
    type: string
    sql:  concat('Level',"-",${MI_ENTITY_depth}) ;;

  }

  dimension: MI_ENTITY_description_search{
    # label: "Level"
    view_label: "MI ENTITY"
    group_label: "Hierarchy Search"
    type: string
    sql: case when ${dimension}="MI_ENTITY" then ${leaf_description} end;;
  }
  }
