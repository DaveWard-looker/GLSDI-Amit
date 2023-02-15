###################################### Data Connection to Fire Database #######################################
# Final Release for the R1 release
connection: "@{connection_name}"
connection: "@{connection_fine_name}"
#connection: "@{connection_name1}"
label: "BFA Detailed SDI"


################ Look ML############

include: "/datagroup.lkml"
include: "/security.lkml"
include: "/BFA_GLSDI_Folder/GLSDI.lkml"



#################################################CMB############################################################
explore: fotc_dp_ce_gl_detail_output_current_period_cmb {
  required_access_grants: [explorer_security_cmb_1]


#Group Level Security : User Data security at Segment Level
  access_filter: {
    field: security_bfa.security_group_model
    user_attribute: security_group_model
  }

  description: "BFA-R2.S22.01"
  label: "GL Detail Output Current Period CMB"
  always_filter: {
    filters: [
      fotc_dp_ce_gl_detail_output_current_period_cmb.format: "M",
      fotc_dp_ce_gl_detail_output_current_period_cmb.accounting_date: "",
      fotc_dp_ce_gl_detail_output_current_period_cmb.gl_balance_reporting_currency_code: "",
      fotc_dp_ce_gl_detail_output_current_period_cmb.grca_entity_identifier: "",
      fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb.dimension_tree_id_parameter_cmb:"1"
    ] }
  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: Global_Standard_Product  {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.fotc_product} = ${Global_Standard_Product.leaf} ;;
    relationship: one_to_one
  }

  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.fotc_product} = ${fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb.leaf} ;;
    relationship: one_to_one


  }


  ############# Entity has 17 level of Hierarchy,Max Depth Value is 17 ##################################
  join: fotc_rd_mi_flat_dimension_mi_entity {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.grca_entity_identifier} = ${fotc_rd_mi_flat_dimension_mi_entity.leaf} ;;
    relationship: one_to_one
  }

  ############# Cost Centre has 10 level of Hierarchy ##################################
  join: FTP_COSTCENTRE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.cost_centre_identifier} = ${FTP_COSTCENTRE.leaf} ;;
    relationship: one_to_one
  }

  ############# SARACEN_GRCA has 15 level of Hierarchy,Max Depth Level is 15 ##################################
  join: SARACEN_GRCA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.grca_reconciliation_key} = ${SARACEN_GRCA.leaf} ;;
    relationship: one_to_one
  }

  #######################################GRCA Average Balance Sheet ##########################################

  join: grca_average_balance_sheet{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.average_balance_grca_reconciliation_key } = ${grca_average_balance_sheet.leaf} ;;
    relationship: one_to_one
  }

############# GOCA Account has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_GOCA_ACCOUNT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.nominal_account_number} = ${FTP_GOCA_ACCOUNT.leaf} ;;
    relationship: one_to_one
  }

############# Summary Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.product_chartfield_code} = ${FTP_SUMMARY_PRODUCT.leaf} ;;
    relationship: one_to_one
  }

############# Customer Type has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_CUSTOMER_TYPE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.customer_type_chartfield_code} = ${FTP_SUMMARY_CUSTOMER_TYPE.leaf} ;;
    relationship: one_to_one
  }

  ############# Segment has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: global_standard_segment_cmb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.fotc_business_segment} = ${global_standard_segment_cmb.leaf} ;;
    relationship: one_to_one
    sql_where: ${global_standard_segment_cmb.level_1}="GSS10002"  ;;
  }
############# Function has 7 level of Hierarchy,Max Depth Level is 7 ##################################
  join: Function{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.mi_function_code} = ${Function.leaf} ;;
    relationship: one_to_one
  }

  ############# MICA has 17 level of Hierarchy,Max Depth Level is 17 ##################################
  join: MICA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.mica_code} = ${MICA.leaf} ;;
    relationship: one_to_one
  }


  ############# MICA CODE AVBS#################################
  join: average_b_s_mica{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.mica_code_avbs} = ${average_b_s_mica.leaf} ;;
    relationship: one_to_one
  }

  ############# Global Business has 5 level of Hierarchy,Max Depth Level is 5 ##################################


  join: GLOBALBUSINESS{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.mi_global_business_code} = ${GLOBALBUSINESS.leaf} ;;
    relationship: one_to_one
  }

  ############# MI Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: MI_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.mi_product_code} = ${MI_PRODUCT.leaf} ;;
    relationship: one_to_one
  }


  join: security_bfa{
    type: inner
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_cmb.security_column} = ${security_bfa.joining_column} ;;
    relationship: one_to_one
  }

}


################################################ PREVIOUS PERIOD CMB##############################################################



explore: fotc_dp_ce_gl_detail_output_previous_period_cmb {
  label: "GL Detail Output Previous Period CMB"

  required_access_grants: [explorer_security_cmb_1]

#Group Level Security : User Data security at Segment Level
  access_filter: {
    field: security_bfa_pp.security_group_model
    user_attribute: security_group_model
  }


  always_filter: {
    filters: [
      fotc_dp_ce_gl_detail_output_previous_period_cmb.format: "M",
      fotc_dp_ce_gl_detail_output_previous_period_cmb.accounting_date: "",
      fotc_dp_ce_gl_detail_output_previous_period_cmb.gl_balance_reporting_currency_code: "",
      fotc_dp_ce_gl_detail_output_previous_period_cmb.grca_entity_identifier: "",
      fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb.dimension_tree_id_parameter_cmb:"1"
    ] }

  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: Global_Standard_Product  {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.fotc_product} = ${Global_Standard_Product.leaf} ;;
    relationship: one_to_one
  }

  ############# Entity has 17 level of Hierarchy,Max Depth Value is 17 ##################################
  join: fotc_rd_mi_flat_dimension_mi_entity {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.grca_entity_identifier} = ${fotc_rd_mi_flat_dimension_mi_entity.leaf} ;;
    relationship: one_to_one
  }

  ############# Cost Centre has 10 level of Hierarchy ##################################
  join: FTP_COSTCENTRE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.cost_centre_identifier} = ${FTP_COSTCENTRE.leaf} ;;
    relationship: one_to_one
  }

  ############# SARACEN_GRCA has 15 level of Hierarchy,Max Depth Level is 15 ##################################
  join: SARACEN_GRCA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.grca_reconciliation_key} = ${SARACEN_GRCA.leaf} ;;
    relationship: one_to_one
  }

  #######################################GRCA Average Balance Sheet ##########################################

  join: grca_average_balance_sheet{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.average_balance_grca_reconciliation_key } = ${grca_average_balance_sheet.leaf} ;;
    relationship: one_to_one
  }


############# GOCA Account has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_GOCA_ACCOUNT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.nominal_account_number} = ${FTP_GOCA_ACCOUNT.leaf} ;;
    relationship: one_to_one
  }

############# Summary Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.product_chartfield_code} = ${FTP_SUMMARY_PRODUCT.leaf} ;;
    relationship: one_to_one
  }

############# Customer Type has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_CUSTOMER_TYPE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.customer_type_chartfield_code} = ${FTP_SUMMARY_CUSTOMER_TYPE.leaf} ;;
    relationship: one_to_one
  }

  ############# Segment has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: global_standard_segment_cmb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.fotc_business_segment} = ${global_standard_segment_cmb.leaf} ;;
    relationship: one_to_one
    sql_where: ${global_standard_segment_cmb.level_1}="GSS10002"  ;;
  }
############# Function has 7 level of Hierarchy,Max Depth Level is 7 ##################################
  join: Function{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.mi_function_code} = ${Function.leaf} ;;
    relationship: one_to_one
  }

  ############# MICA has 17 level of Hierarchy,Max Depth Level is 17 ##################################
  join: MICA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.mica_code} = ${MICA.leaf} ;;
    relationship: one_to_one
  }

  ############# MICA CODE AVBS#################################
  join: average_b_s_mica{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.mica_code_avbs} = ${average_b_s_mica.leaf} ;;
    relationship: one_to_one
  }

  ############# Global Business has 5 level of Hierarchy,Max Depth Level is 5 ##################################
  join: GLOBALBUSINESS{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.mi_global_business_code} = ${GLOBALBUSINESS.leaf} ;;
    relationship: one_to_one
  }

  ############# MI Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: MI_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.mi_product_code} = ${MI_PRODUCT.leaf} ;;
    relationship: one_to_one
  }

  ############# Product Rollup Level 6 ##################################
  join: fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.fotc_product} = ${fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb.leaf} ;;
    relationship: one_to_one
  }

  join: security_bfa_pp{
    type: inner
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_cmb.security_column} = ${security_bfa_pp.joining_column} ;;
    relationship: one_to_one
  }

}
############################################################### PREVIOUS YEAR CMB #############################################
explore: fotc_dp_ce_gl_detail_output_previous_year_cmb {
  label: "GL Detail Output Previous Year CMB"

  required_access_grants: [explorer_security_cmb_1]


#Group Level Security : User Data security at Segment Level
  access_filter: {
    field: security_bfa_py.security_group_model
    user_attribute: security_group_model
  }


  always_filter: {
    filters: [
      fotc_dp_ce_gl_detail_output_previous_year_cmb.format: "M",
      fotc_dp_ce_gl_detail_output_previous_year_cmb.accounting_date: "",
      fotc_dp_ce_gl_detail_output_previous_year_cmb.gl_balance_reporting_currency_code: "",
      fotc_dp_ce_gl_detail_output_previous_year_cmb.grca_entity_identifier: "",
      fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb.dimension_tree_id_parameter_cmb:"1"
    ] }

  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: Global_Standard_Product  {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.fotc_product} = ${Global_Standard_Product.leaf} ;;
    relationship: one_to_one
  }

  ############# Entity has 17 level of Hierarchy,Max Depth Value is 17 ##################################
  join: fotc_rd_mi_flat_dimension_mi_entity {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.grca_entity_identifier} = ${fotc_rd_mi_flat_dimension_mi_entity.leaf} ;;
    relationship: one_to_one
  }

  ############# Cost Centre has 10 level of Hierarchy ##################################
  join: FTP_COSTCENTRE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.cost_centre_identifier} = ${FTP_COSTCENTRE.leaf} ;;
    relationship: one_to_one
  }

  ############# SARACEN_GRCA has 15 level of Hierarchy,Max Depth Level is 15 ##################################
  join: SARACEN_GRCA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.grca_reconciliation_key} = ${SARACEN_GRCA.leaf} ;;
    relationship: one_to_one
  }

  #######################################GRCA Average Balance Sheet ##########################################

  join: grca_average_balance_sheet{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.average_balance_grca_reconciliation_key } = ${grca_average_balance_sheet.leaf} ;;
    relationship: one_to_one
  }


############# GOCA Account has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_GOCA_ACCOUNT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.nominal_account_number} = ${FTP_GOCA_ACCOUNT.leaf} ;;
    relationship: one_to_one
  }

############# Summary Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.product_chartfield_code} = ${FTP_SUMMARY_PRODUCT.leaf} ;;
    relationship: one_to_one
  }

############# Customer Type has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_CUSTOMER_TYPE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.customer_type_chartfield_code} = ${FTP_SUMMARY_CUSTOMER_TYPE.leaf} ;;
    relationship: one_to_one
  }

  ############# Segment has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: global_standard_segment_cmb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.fotc_business_segment} = ${global_standard_segment_cmb.leaf} ;;
    relationship: one_to_one
    sql_where: ${global_standard_segment_cmb.level_1}="GSS10002"  ;;
  }
############# Function has 7 level of Hierarchy,Max Depth Level is 7 ##################################
  join: Function{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.mi_function_code} = ${Function.leaf} ;;
    relationship: one_to_one
  }

  ############# MICA has 17 level of Hierarchy,Max Depth Level is 17 ##################################
  join: MICA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.mica_code} = ${MICA.leaf} ;;
    relationship: one_to_one
  }

  ############# MICA CODE AVBS#################################
  join: average_b_s_mica{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.mica_code_avbs} = ${average_b_s_mica.leaf} ;;
    relationship: one_to_one
  }

  ############# Global Business has 5 level of Hierarchy,Max Depth Level is 5 ##################################
  join: GLOBALBUSINESS{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.mi_global_business_code} = ${GLOBALBUSINESS.leaf} ;;
    relationship: one_to_one
  }

  ############# MI Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: MI_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.mi_product_code} = ${MI_PRODUCT.leaf} ;;
    relationship: one_to_one
  }

  ############# Product Rollup Level 6 ##################################
  join: fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.fotc_product} = ${fotc_rd_mi_flat_dimension_fotc_product_rollup_cmb.leaf} ;;
    relationship: one_to_one
  }

  join: security_bfa_py{
    type: inner
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_cmb.security_column} = ${security_bfa_py.joining_column} ;;
    relationship: one_to_one
  }

}
