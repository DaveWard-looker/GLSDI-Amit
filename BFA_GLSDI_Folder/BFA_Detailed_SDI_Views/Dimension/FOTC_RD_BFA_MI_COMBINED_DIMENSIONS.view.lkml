view: fotc_rd_bfa_mi_combined_dimensions {
  label: "Global Standard Product"
  derived_table: {

 sql: select * from  DISCOVERY.FOTC_RD_BFA_MI_COMBINED_DIMENSIONS where dimension='Global_Standard_Product' ;;
}
dimension: dimension  {
  type: string
  sql: ${TABLE}.dimension ;;
  }

  dimension: group_code  {
    type: string
    sql: ${TABLE}.group_code ;;
  }

  dimension: group_description {
    type: string
    sql: ${TABLE}.group_description ;;
  }

  dimension: group_index{
    type: string
    sql: ${TABLE}.group_index ;;
  }

  dimension: parent_code {
    type: string
    sql: ${TABLE}.parent_code;;
  }

  dimension: child_code {
    type: string
    sql: ${TABLE}.child_code;;
  }

  dimension: leaf_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.leaf_code ;;
  }

  dimension: leaf_description {
    type: string
    sql: ${TABLE}.leaf_description ;;
  }

  dimension: leaf_index {
    type: string
    sql: ${TABLE}.leaf_index ;;
  }

}
