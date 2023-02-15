connection: "@{connection_name}"
connection: "@{connection_fine_name}"
#connection: "@{connection_name1}"
label: "BFA GLSDI Hierarchical"

include: "/datagroup.lkml"
include: "/GLSDI_Hierarchical_Folder/GLSDI_Hierarchy_Views/fotc_rd_bfa_mi_flat_dimensions_looker.view"


explore: fotc_rd_bfa_mi_flat_dimensions_looker{
  label: "GLSDI Hierarchical Data "

  # always_filter: {
  #   filters: [
  #     fotc_rd_bfa_mi_flat_dimensions_looker.dimension: "FTP_COSTCENTRE"
  #   ] }
}
