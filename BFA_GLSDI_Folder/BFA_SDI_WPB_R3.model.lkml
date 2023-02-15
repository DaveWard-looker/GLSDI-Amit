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


####################################################WPB current Period###########################################################
################################### #################WPB #######################################
##############################################################################################################################################



explore: fotc_dp_ce_gl_detail_output_current_period_wpb {
  required_access_grants: [explorer_security_wpb_1]


#Group Level Security : User Data security at Segment Level
  access_filter: {
    field: security_bfa.security_group_model
    user_attribute: security_group_model
  }

  description: "BFA-R2.S22.01"
  label: "GL Detail Output Current Period WPB"
  always_filter: {
    filters: [
      fotc_dp_ce_gl_detail_output_current_period_wpb.format: "M",
      fotc_dp_ce_gl_detail_output_current_period_wpb.accounting_date: "",
      fotc_dp_ce_gl_detail_output_current_period_wpb.gl_balance_reporting_currency_code: "",
      fotc_dp_ce_gl_detail_output_current_period_wpb.grca_entity_identifier: "",
      fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb.dimension_tree_id_parameter_wpb: "1"


    ] }
  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: Global_Standard_Product  {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.fotc_product} = ${Global_Standard_Product.leaf} ;;
    relationship: one_to_one
  }

  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.fotc_product} = ${fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb.leaf} ;;
    relationship: one_to_one


  }


  ############# Entity has 17 level of Hierarchy,Max Depth Value is 17 ##################################
  join: fotc_rd_mi_flat_dimension_mi_entity {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.grca_entity_identifier} = ${fotc_rd_mi_flat_dimension_mi_entity.leaf} ;;
    relationship: one_to_one
  }

  ############# Cost Centre has 10 level of Hierarchy ##################################
  join: FTP_COSTCENTRE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.cost_centre_identifier} = ${FTP_COSTCENTRE.leaf} ;;
    relationship: one_to_one
  }

  ############# SARACEN_GRCA has 15 level of Hierarchy,Max Depth Level is 15 ##################################
  join: SARACEN_GRCA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.grca_reconciliation_key} = ${SARACEN_GRCA.leaf} ;;
    relationship: one_to_one
  }

  #######################################GRCA Average Balance Sheet ##########################################

  join: grca_average_balance_sheet{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.average_balance_grca_reconciliation_key } = ${grca_average_balance_sheet.leaf} ;;
    relationship: one_to_one
  }

############# GOCA Account has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_GOCA_ACCOUNT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.nominal_account_number} = ${FTP_GOCA_ACCOUNT.leaf} ;;
    relationship: one_to_one
  }

############# Summary Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.product_chartfield_code} = ${FTP_SUMMARY_PRODUCT.leaf} ;;
    relationship: one_to_one
  }

############# Customer Type has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_CUSTOMER_TYPE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.customer_type_chartfield_code} = ${FTP_SUMMARY_CUSTOMER_TYPE.leaf} ;;
    relationship: one_to_one
  }

  ############# Segment has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: global_standard_segment_wbp{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.fotc_business_segment} = ${global_standard_segment_wbp.leaf} ;;
    relationship: one_to_one
    sql_where: ${global_standard_segment_wbp.level_1}="GSS10001"  ;;

  }
############# Function has 7 level of Hierarchy,Max Depth Level is 7 ##################################
  join: Function{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.mi_function_code} = ${Function.leaf} ;;
    relationship: one_to_one
  }

  ############# MICA has 17 level of Hierarchy,Max Depth Level is 17 ##################################
  join: MICA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.mica_code} = ${MICA.leaf} ;;
    relationship: one_to_one
  }


  ############# MICA CODE AVBS#################################
  join: average_b_s_mica{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.mica_code_avbs} = ${average_b_s_mica.leaf} ;;
    relationship: one_to_one
  }

  ############# Global Business has 5 level of Hierarchy,Max Depth Level is 5 ##################################


  join: GLOBALBUSINESS{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.mi_global_business_code} = ${GLOBALBUSINESS.leaf} ;;
    relationship: one_to_one
  }

  ############# MI Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: MI_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.mi_product_code} = ${MI_PRODUCT.leaf} ;;
    relationship: one_to_one
  }


  join: security_bfa{
    type: inner
    sql_on: ${fotc_dp_ce_gl_detail_output_current_period_wpb.security_column} = ${security_bfa.joining_column} ;;
    relationship: one_to_one
  }

}



#################################################### Previous Period WPB###########################################################
################################### #################WPB #######################################
##############################################################################################################################################




explore: fotc_dp_ce_gl_detail_output_previous_period_wpb {
  required_access_grants: [explorer_security_wpb_1]


#Group Level Security : User Data security at Segment Level
  access_filter: {
    field: security_bfa_pp.security_group_model
    user_attribute: security_group_model
  }




  label: "GL Detail Output Previous Period WPB"
  always_filter: {
    filters: [
      fotc_dp_ce_gl_detail_output_previous_period_wpb.format: "M",
      fotc_dp_ce_gl_detail_output_previous_period_wpb.accounting_date: "",
      fotc_dp_ce_gl_detail_output_previous_period_wpb.gl_balance_reporting_currency_code: "",
      fotc_dp_ce_gl_detail_output_previous_period_wpb.grca_entity_identifier: "",
      fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb.dimension_tree_id_parameter_wpb: "1"


    ] }
  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: Global_Standard_Product  {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.fotc_product} = ${Global_Standard_Product.leaf} ;;
    relationship: one_to_one
  }

  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.fotc_product} = ${fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb.leaf} ;;
    relationship: one_to_one


  }


  ############# Entity has 17 level of Hierarchy,Max Depth Value is 17 ##################################
  join: fotc_rd_mi_flat_dimension_mi_entity {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.grca_entity_identifier} = ${fotc_rd_mi_flat_dimension_mi_entity.leaf} ;;
    relationship: one_to_one
  }

  ############# Cost Centre has 10 level of Hierarchy ##################################
  join: FTP_COSTCENTRE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.cost_centre_identifier} = ${FTP_COSTCENTRE.leaf} ;;
    relationship: one_to_one
  }

  ############# SARACEN_GRCA has 15 level of Hierarchy,Max Depth Level is 15 ##################################
  join: SARACEN_GRCA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.grca_reconciliation_key} = ${SARACEN_GRCA.leaf} ;;
    relationship: one_to_one
  }

  #######################################GRCA Average Balance Sheet ##########################################

  join: grca_average_balance_sheet{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.average_balance_grca_reconciliation_key } = ${grca_average_balance_sheet.leaf} ;;
    relationship: one_to_one
  }

############# GOCA Account has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_GOCA_ACCOUNT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.nominal_account_number} = ${FTP_GOCA_ACCOUNT.leaf} ;;
    relationship: one_to_one
  }

############# Summary Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.product_chartfield_code} = ${FTP_SUMMARY_PRODUCT.leaf} ;;
    relationship: one_to_one
  }

############# Customer Type has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_CUSTOMER_TYPE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.customer_type_chartfield_code} = ${FTP_SUMMARY_CUSTOMER_TYPE.leaf} ;;
    relationship: one_to_one
  }

  ############# Segment has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: global_standard_segment_wbp{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.fotc_business_segment} = ${global_standard_segment_wbp.leaf} ;;
    relationship: one_to_one
    sql_where: ${global_standard_segment_wbp.level_1}="GSS10001"  ;;

  }
############# Function has 7 level of Hierarchy,Max Depth Level is 7 ##################################
  join: Function{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.mi_function_code} = ${Function.leaf} ;;
    relationship: one_to_one
  }

  ############# MICA has 17 level of Hierarchy,Max Depth Level is 17 ##################################
  join: MICA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.mica_code} = ${MICA.leaf} ;;
    relationship: one_to_one
  }


  ############# MICA CODE AVBS#################################
  join: average_b_s_mica{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.mica_code_avbs} = ${average_b_s_mica.leaf} ;;
    relationship: one_to_one
  }

  ############# Global Business has 5 level of Hierarchy,Max Depth Level is 5 ##################################


  join: GLOBALBUSINESS{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.mi_global_business_code} = ${GLOBALBUSINESS.leaf} ;;
    relationship: one_to_one
  }

  ############# MI Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: MI_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.mi_product_code} = ${MI_PRODUCT.leaf} ;;
    relationship: one_to_one
  }


  join: security_bfa_pp{
    type: inner
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_period_wpb.security_column} = ${security_bfa_pp.joining_column} ;;
    relationship: one_to_one
  }

}


#################################################### Previous Year WPB###########################################################
################################### WPB #######################################
##############################################################################################################################################


explore: fotc_dp_ce_gl_detail_output_previous_year_wpb {
  required_access_grants: [explorer_security_wpb_1]


#Group Level Security : User Data security at Segment Level
  access_filter: {
    field: security_bfa_py.security_group_model
    user_attribute: security_group_model
  }


  label: "GL Detail Output Previous Year WPB"
  always_filter: {
    filters: [
      fotc_dp_ce_gl_detail_output_previous_year_wpb.format: "M",
      fotc_dp_ce_gl_detail_output_previous_year_wpb.accounting_date: "",
      fotc_dp_ce_gl_detail_output_previous_year_wpb.gl_balance_reporting_currency_code: "",
      fotc_dp_ce_gl_detail_output_previous_year_wpb.grca_entity_identifier: "",
      fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb.dimension_tree_id_parameter_wpb: "1"


    ] }
  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: Global_Standard_Product  {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.fotc_product} = ${Global_Standard_Product.leaf} ;;
    relationship: one_to_one
  }

  ############# Standard Product has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.fotc_product} = ${fotc_rd_mi_flat_dimension_fotc_product_rollup_wpb.leaf} ;;
    relationship: one_to_one


  }


  ############# Entity has 17 level of Hierarchy,Max Depth Value is 17 ##################################
  join: fotc_rd_mi_flat_dimension_mi_entity {
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.grca_entity_identifier} = ${fotc_rd_mi_flat_dimension_mi_entity.leaf} ;;
    relationship: one_to_one
  }

  ############# Cost Centre has 10 level of Hierarchy ##################################
  join: FTP_COSTCENTRE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.cost_centre_identifier} = ${FTP_COSTCENTRE.leaf} ;;
    relationship: one_to_one
  }

  ############# SARACEN_GRCA has 15 level of Hierarchy,Max Depth Level is 15 ##################################
  join: SARACEN_GRCA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.grca_reconciliation_key} = ${SARACEN_GRCA.leaf} ;;
    relationship: one_to_one
  }

  #######################################GRCA Average Balance Sheet ##########################################

  join: grca_average_balance_sheet{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.average_balance_grca_reconciliation_key } = ${grca_average_balance_sheet.leaf} ;;
    relationship: one_to_one
  }

############# GOCA Account has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_GOCA_ACCOUNT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.nominal_account_number} = ${FTP_GOCA_ACCOUNT.leaf} ;;
    relationship: one_to_one
  }

############# Summary Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.product_chartfield_code} = ${FTP_SUMMARY_PRODUCT.leaf} ;;
    relationship: one_to_one
  }

############# Customer Type has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: FTP_SUMMARY_CUSTOMER_TYPE{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.customer_type_chartfield_code} = ${FTP_SUMMARY_CUSTOMER_TYPE.leaf} ;;
    relationship: one_to_one
  }

  ############# Segment has 4 level of Hierarchy,Max Depth Level is 4 ##################################
  join: global_standard_segment_wbp{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.fotc_business_segment} = ${global_standard_segment_wbp.leaf} ;;
    relationship: one_to_one
    sql_where: ${global_standard_segment_wbp.level_1}="GSS10001"  ;;

  }
############# Function has 7 level of Hierarchy,Max Depth Level is 7 ##################################
  join: Function{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.mi_function_code} = ${Function.leaf} ;;
    relationship: one_to_one
  }

  ############# MICA has 17 level of Hierarchy,Max Depth Level is 17 ##################################
  join: MICA{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.mica_code} = ${MICA.leaf} ;;
    relationship: one_to_one
  }


  ############# MICA CODE AVBS#################################
  join: average_b_s_mica{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.mica_code_avbs} = ${average_b_s_mica.leaf} ;;
    relationship: one_to_one
  }

  ############# Global Business has 5 level of Hierarchy,Max Depth Level is 5 ##################################


  join: GLOBALBUSINESS{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.mi_global_business_code} = ${GLOBALBUSINESS.leaf} ;;
    relationship: one_to_one
  }

  ############# MI Product has 9 level of Hierarchy,Max Depth Level is 9 ##################################
  join: MI_PRODUCT{
    type: left_outer
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.mi_product_code} = ${MI_PRODUCT.leaf} ;;
    relationship: one_to_one
  }


  join: security_bfa_py{
    type: inner
    sql_on: ${fotc_dp_ce_gl_detail_output_previous_year_wpb.security_column} = ${security_bfa_py.joining_column} ;;
    relationship: one_to_one
  }

}
