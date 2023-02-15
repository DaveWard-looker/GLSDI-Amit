view: global_standard_product_h{
    label: "Global Standard Product"
    extension: required

    set:  Global_Standard_Product_description_fields {
      fields: [ Global_Standard_Product_leaf_description, Global_Standard_Product_description_0, Global_Standard_Product_description_1, Global_Standard_Product_description_2, Global_Standard_Product_description_3, Global_Standard_Product_description_4, Global_Standard_Product_description_5, Global_Standard_Product_description_6, Global_Standard_Product_description_7]}

    set:  Global_Standard_Product_level_fields {
      fields: [ Global_Standard_Product_leaf, Global_Standard_Product_level_0, Global_Standard_Product_level_1, Global_Standard_Product_level_2, Global_Standard_Product_level_3, Global_Standard_Product_level_4, Global_Standard_Product_level_5, Global_Standard_Product_level_6, Global_Standard_Product_level_7]
    }

    dimension:  Global_Standard_Product_description_0 {
      label: "Description 0"
      view_label: "Global Standard Product"
      group_label: "Level 0"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${description_0} end;;
      drill_fields: [ Global_Standard_Product_description_fields*]
    }

    dimension:  Global_Standard_Product_level_0 {
      label: "Level 0"
      view_label: "Global Standard Product"
      group_label: "Level 0"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${level_0} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]
    }


    dimension:  Global_Standard_Product_description_1 {
      label: "Description 1"
      view_label: "Global Standard Product"
      group_label: "Level 1"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${description_1} end;;
      drill_fields: [ Global_Standard_Product_description_fields*]
    }

    dimension:  Global_Standard_Product_level_1 {
      label: "Level 1"
      view_label: "Global Standard Product"
      group_label: "Level 1"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${level_1} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]
    }


    dimension:  Global_Standard_Product_description_2 {
      label: "Description 2"
      view_label: "Global Standard Product"
      group_label: "Level 2"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${description_2} end;;
      drill_fields: [ Global_Standard_Product_description_fields*]
    }

    dimension:  Global_Standard_Product_level_2 {
      label: "Level 2"
      view_label: "Global Standard Product"
      group_label: "Level 2"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${level_2} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]
    }

    dimension:  Global_Standard_Product_description_3 {
      label: "Description 3"
      view_label: "Global Standard Product"
      group_label: "Level 3"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${description_3} end;;
      drill_fields: [ Global_Standard_Product_description_fields*]
    }

    dimension:  Global_Standard_Product_level_3 {
      label: "Level 3"
      view_label: "Global Standard Product"
      group_label: "Level 3"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${level_3} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]
    }

    dimension:  Global_Standard_Product_description_4 {
      label: "Description 4"
      view_label: "Global Standard Product"
      group_label: "Level 4"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${description_4} end;;
      drill_fields: [ Global_Standard_Product_description_fields*]
    }

    dimension:  Global_Standard_Product_level_4 {
      label: "Level 4"
      view_label: "Global Standard Product"
      group_label: "Level 4"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${level_4} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]
    }
    dimension:  Global_Standard_Product_description_5 {
      label: "Description 5"
      view_label: "Global Standard Product"
      group_label: "Level 5"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${description_5} end;;
    }

    dimension:  Global_Standard_Product_level_5 {
      label: "Level 5"
      view_label: "Global Standard Product"
      group_label: "Level 5"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${level_5} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]
    }
    dimension:  Global_Standard_Product_description_6 {
      label: "Description 6"
      view_label: "Global Standard Product"
      group_label: "Level 6"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${description_6} end;;
      drill_fields: [ Global_Standard_Product_description_fields*]
    }

    dimension:  Global_Standard_Product_level_6 {
      label: "Level 6"
      view_label: "Global Standard Product"
      group_label: "Level 6"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${level_6} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]
    }
    dimension:  Global_Standard_Product_description_7 {
      label: "Description 7"
      view_label: "Global Standard Product"
      group_label: "Level 7"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${description_7} end;;
      drill_fields: [ Global_Standard_Product_description_fields*]
    }

    dimension:  Global_Standard_Product_level_7 {
      label: "Level 7"
      view_label: "Global Standard Product"
      group_label: "Level 7"
      type: string
      sql: case when ${dimension}=" Global_Standard_Product" then ${level_7} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]
    }


    dimension:  Global_Standard_Product_leaf {
      label: "Leaf"
      view_label: "Global Standard Product"
      group_label: "Leaf"
      type: string
      #primary_key: yes
      sql: case when ${dimension}=" Global_Standard_Product" then ${code} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]

    }

    dimension:  Global_Standard_Product_leaf_description {
      label: "Leaf Description"
      view_label: "Global Standard Product"
      group_label: "Leaf"
      type: string
      # primary_key: yes
      sql: case when ${dimension}=" Global_Standard_Product" then  ${leaf_description} end ;;
      drill_fields: [ Global_Standard_Product_level_fields*]

    }

  dimension: Global_Standard_Product_depth {
    label: "Depth"
    view_label: "Global Standard Product"
    #group_label: "Hierarchy Search"
    type: string
    sql: case when ${dimension}="Global_Standard_Product" then ${depth} end;;

  }

  dimension: Global_Standard_Product_Level{
    label: "Level"
    view_label: "Global Standard Product"
    group_label: "Hierarchy Search"
    type: string
    sql:  concat('Level',"-",${Global_Standard_Product_depth}) ;;

  }

  dimension: Global_Standard_Product_description_search{
    # label: "Level"
    view_label: "Global Standard Product"
    group_label: "Hierarchy Search"
    type: string
    sql: case when ${dimension}="Global_Standard_Product" then ${leaf_description} end;;

  }
  }
