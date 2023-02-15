#
#
###################################### Data Connection to Fire Database #######################################
# Final Release for the R1 release
connection: "@{connection_name}"
connection: "@{connection_fine_name}"
#connection: "@{connection_name1}"
label: "BFA Control Reports"

#################################Include all the View for the Explorer##################################################

# include: "/views/*.view"
# include: "*.lkml"
#include: "/**/explores.lkml"

################ Look ML############
#
include: "/datagroup.lkml"
include: "/Control_Report_Folder/Control.lkml"
include: "/security.lkml"
explore: fotc_iaa_summary_mapping_exception{
  label: "MAPPING EXCEPTION REPORT"
#  persist_with: BFA_Control_average_b_s_mica
  always_filter: {
    filters: [
      fotc_iaa_summary_mapping_exception.region: "",
      fotc_iaa_summary_mapping_exception.grca_entity_identifier: "",
      fotc_iaa_summary_mapping_exception.booking_entity_identifier: "",
      fotc_iaa_summary_mapping_exception.accounting_regulation_category_code: "IFRS",
      fotc_iaa_summary_mapping_exception.format: "M"]
  }

  join: MICA_CONTROL_REPORT {
    type: inner
    sql_on: ${MICA_CONTROL_REPORT.code}= ${fotc_iaa_summary_mapping_exception.mica_code} ;;
    relationship: one_to_one
  }
  #add query for quick start from Becky on 04Jan2023
  #change query order from Becky on 06Jan2023
  query: MAPPING_EXCEPTION_REPORT{
    dimensions: [
      target,
      accounting_date,
      grca_entity_identifier,
      booking_entity_identifier,
      accounting_regulation_category_code,
      mi_data_source,
      mica_code,
      cost_centre_identifier,
      nominal_account_number,
      grca,
      ftp_source,
      fotc_product,
      mi_product,
      mi_global_business,
      gl_count,
      cost_centre_identifier_1,
      customer_type_chartfield_code,
      product_chartfield_code,
      nominal_account_number_1,
      transfer_pricing_curve,
      next_interest_reset_date,
      fotc_product_1,
      grca_reconciliation_key_1,
      average_balance_interest_type,
      affiliate_chartfield_code,
      booking_entity_identifier_1,
      mi_function_code,
      mi_global_business_code,
      ifrs9_stage,
      grca_intercompany_indicator,
      grca_entity_identifier_1,
      grca_entity_identifier_of_the_affiliate,
      mica_code_1
    ]
    measures: [mi_gl_balance_report_currency]
    filters: [
      fotc_iaa_summary_mapping_exception.accounting_regulation_category_code: "IFRS",
      fotc_iaa_summary_mapping_exception.format: "M",
      fotc_iaa_summary_mapping_exception.region: "",
      fotc_iaa_summary_mapping_exception.grca_entity_identifier: "",
      fotc_iaa_summary_mapping_exception.booking_entity_identifier: "",

    ]
    limit: 500
  }
}

explore: fotc_rd_bfa_mia_results_preview_prior_submission {
  required_access_grants: [explorer_security_bfa_all]
  # Update label for C22 on 8Feb2023
  label: "Report_C22_BFA_ Standardised GL Detail SDI vs. MI table"
  description: "BFA-R2.S22.4"
  # persist_with: BFA_Control_average_b_s_mica
  always_filter: {
    filters: [
      fotc_rd_bfa_mia_results_preview_prior_submission.format: "M"]
  }

  join: MICA_CONTROL_REPORT {
    type: inner
    sql_on: ${MICA_CONTROL_REPORT.code}= ${fotc_rd_bfa_mia_results_preview_prior_submission.mica_code} ;;
    relationship: one_to_one
  }
  join: fotc_rd_mi_flat_dimension_mi_entity_control {
    type: inner
    sql_on: ${fotc_rd_bfa_mia_results_preview_prior_submission.legal_entity}= ${fotc_rd_mi_flat_dimension_mi_entity_control.leaf};;
    relationship: one_to_one
  }
  query:MICA_Report {
    label: "Report_C22_BFA_ Standardised GL Detail SDI vs. MI table"
    dimensions: [legal_entity,accounting_treatment, mica_code, MICA_CONTROL_REPORT.mica_code_description, global_business]
    measures: [  fotc_standardised_gl_detail_amount,final_mia_extract, fotc_mia_p3_extract_amount, difference, entity_inclusion,data_exclusion,  difference, total, variance]
    filters: [fotc_rd_bfa_mia_results_preview_prior_submission.format: "M"
    ]
    limit: 500
  }

}


explore: fotc_rd_bfa_saracen_results_preview_prior_submission {
  required_access_grants: [explorer_security_bfa_all]
  # Update label for C22 on 8Feb2023
  label: "Report_C23_BFA_Standardised GL Detail SDI vs. Saracen table"
  description: "BFA-R2.S22.4"
  # persist_with: BFA_Control_SARACEN_GRCA
  always_filter: {
    filters: [
      fotc_rd_bfa_saracen_results_preview_prior_submission.format: "M"]
  }

  join: SARACEN_GRCA_CONTROL_REPORT {
    type: inner
    sql_on: ${SARACEN_GRCA_CONTROL_REPORT.code}= ${fotc_rd_bfa_saracen_results_preview_prior_submission.s18_account} ;;
    relationship: one_to_one
  }
  join: fotc_rd_mi_flat_dimension_mi_entity_control {
    type: inner
    sql_on: ${fotc_rd_bfa_saracen_results_preview_prior_submission.legal_entity}= ${fotc_rd_mi_flat_dimension_mi_entity_control.leaf};;
    relationship: one_to_one
  }

  query:SARACEN_GRCA_Report  {
    label: "Report_C23_BFA_Standardised GL Detail SDI vs. Saracen table"
    dimensions: [legal_entity, accounting_treatment, s18_account, SARACEN_GRCA_CONTROL_REPORT.grca_code_description, s18_icp, custom_1 ]
    measures: [ fotc_standardised_gl_detail_amount, final_saracen_extract, fotc_saracen_p3_extract_amount, difference,  entity_inclusion, data_exclusion, total, variance]
    filters: [
      fotc_rd_bfa_saracen_results_preview_prior_submission.format: "M"
    ]
    limit: 500
  }


}



# Place in `BFA_SDI_Data_Discovery` model

# explore: +fotc_rd_bfa_saracen_results_preview_prior_submission {
#   aggregate_table: rollup__accounting_treatment__entity__global_business__s18_account {
#     query: {
#       dimensions: [accounting_treatment, legal_entity, global_business, s18_account]
#       measures: [variance, data_exclusion, difference, entity_inclusion, fotc_saracen_p3_extract_amount, fotc_standardised_gl_detail_amount, difference]
#       filters: [fotc_rd_bfa_saracen_results_preview_prior_submission.format: "M"]
#     }

#     materialization: {
#       datagroup_trigger: BFA_Control_SARACEN_GRCA
#     }
#   }
# }
# Place in `BFA_SDI_Data_Discovery` model

# explore: +fotc_rd_bfa_mia_results_preview_prior_submission {
#   aggregate_table: rollup__accounting_treatment__entity__global_business__mica {
#     query: {
#       dimensions: [accounting_treatment, legal_entity, global_business, mica_code]
#       measures: [variance, data_exclusion, difference, entity_inclusion, fotc_mia_p3_extract_amount, fotc_standardised_gl_detail_amount, difference]
#       filters: [fotc_rd_bfa_mia_results_preview_prior_submission.format: "M"]
#     }

#     materialization: {
#       datagroup_trigger: BFA_Control_average_b_s_mica
#     }
#   }
# }

# Create new view for C30 manual adjustments by Jim on 11Jan2023
explore: fotc_dp_ce_gl_detail_adjustment {
  required_access_grants: [explorer_security_bfa_all]
  #persist_with: BFA_glsdi_datagroup_current_year
#persist_for: "24 hours"
#Group Level Security : User Data security at Segment Level

  description: "BFA-R2.S22.01"
  label: "Manual Adjustments"



  # query: Manual_Adjustments_Report{
  #   dimensions: [mi_data_source]
  # }

  # Create new report for C30 by Jim on 10Jan2023
  query:Manual_Adjustments_Report {
    dimensions: [mi_data_source, pre_allocation_engine, journal_id, journal_line_number, journal_description,accounting_year ,accounting_month,accounting_date,
      mi_global_business_code, mica_code, mica_code_avbs, booking_entity_identifier, cost_centre_identifier, mi_function_code,
      mi_channel, fotc_product, mi_product_code, affiliate_chartfield_code, grca_entity_identifier, grca_account_type, grca_intercompany_indicator,
      fotc_business_segment, managed_entity, managed_contra_entity, managed_brand, gl_balance_reporting_currency_code,
      adjustment_type, date_posted, posted_by, date_approved, approved_by]
    measures: [ gl_balance_in_reporting_currency, year_to_date_average_balance_in_functional_currency, month_to_date_average_balance_in_functional_currency]
    filters: [mi_data_source: "MI_Manual_Adjustment"]
    limit: 500
  }



}

# C10 requirement from Jim on 7Feb2023
explore: fotc_dp_bfa_balance_traceability_dashboard_grca_mtd {
  label: "GRCA MTD Balance"
  required_access_grants: [explorer_security_bfa_all]
  always_filter: {
    filters: [
      fotc_dp_bfa_balance_traceability_dashboard_grca_mtd.legal_entity: "3811",
      fotc_dp_bfa_balance_traceability_dashboard_grca_mtd.mi_global_business: "ALL",
      fotc_dp_bfa_balance_traceability_dashboard_grca_mtd.accounting_regulation_code: "IFRS",
      fotc_dp_bfa_balance_traceability_dashboard_grca_mtd.region: "",
      fotc_dp_bfa_balance_traceability_dashboard_grca_mtd.date_time_stamp_date: "",
      fotc_dp_bfa_balance_traceability_dashboard_grca_mtd.run_uuid: ""
    ]
  }

# C10 requirement from Jim on 7Feb2023
  query:GRCA_MTD_Balance_Report {
    dimensions: [justified_description_mica]
    measures: [ gl_detail_sdi_balance_type_mtd, grca_phase_3_mapping_mtd, mi_allocation_balance_type_mtd, allocation_repair_mtd, automated_repair_balance_type_mtd, mi_manual_adjustment_balance_type_mtd,
              calculated_final_standardised_gl_detail_sdi_mtd_excl_corp,corp_re_segmentation_mtd,calculated_final_standardised_gl_detail_sdi_mtd_incl_corp,final_standardised_gl_detail_sdi_mtd,difference_mtd]
    filters: [legal_entity: "3811",
              mi_global_business: "ALL",
              accounting_regulation_code: "IFRS",
              region: "",
              date_time_stamp_date: "",
              run_uuid: ""]
    limit: 500
  }
}
