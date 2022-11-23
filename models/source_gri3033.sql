{{ config( 
        materialization = 'table',
        tags = ["gri3033", "source", "water", "datavault"]
)}}


select 
    gri.CompanyId,
    PostingMonth,
    fw_surf_withd,
    nfw_surf_withd,
    fw_gr_withd,
    nfw_gr_withd,
    fw_sea_withd,
    nfw_sea_withd,
    fw_prod_withd,
    nfw_prod_withd,
    fw_third_withd,
    nfw_third_withd,
    fw_surf_withd_s,
    nfw_surf_withd_s,
    fw_gr_withd_s,
    nfw_gr_withd_s,
    fw_sea_withd_s,
    nfw_sea_withd_s,
    fw_prod_withd_s,
    nfw_prod_withd_s,
    fw_third_withd_s,
    nfw_third_withd_s,
    company
from
    {{ ref('gri3033') }} gri
left join
    {{ ref('goal') }} goal
    on gri.companyid = goal.companyid