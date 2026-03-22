cannabinoids_project := "/home/sdiebolt/Documents/Work/cannabinoids-project/"
psilocybin_project := "/home/sdiebolt/Documents/Work/psilocybin-project/"

methods_figures := "content/chapters/3-pharmaco/figures/methods"
cannabinoids_figures := "content/chapters/3-pharmaco/figures/cannabinoids"
psilocybin_figures := "content/chapters/3-pharmaco/figures/psilocybin"

default:
    @just --list

build:
    typst compile main.typ

push-public:
    #!/usr/bin/env bash
    set -euo pipefail
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    temp_branch="publish-squash-$$"
    git checkout --orphan "$temp_branch"
    git add -A
    git commit -m "feat: PhD thesis submission"
    git push public "$temp_branch:main" --force
    git checkout "$current_branch"
    git branch -D "$temp_branch"

pharmacofig:
    cp {{cannabinoids_project}}/figures/motion.png {{cannabinoids_figures}}
    cp {{cannabinoids_project}}/figures/correlation-analysis/group-level_correlation-matrices.png {{cannabinoids_figures}}
    cp {{cannabinoids_project}}/figures/connectivity-timeseries/connectivity_timeseries.png {{cannabinoids_figures}}
    cp {{cannabinoids_project}}/figures/rcbv/cbv_dose_response.png {{cannabinoids_figures}}
    cp {{cannabinoids_project}}/figures/rcbv/cbv_chemical_control.png {{cannabinoids_figures}}
    cp {{cannabinoids_project}}/figures/summary.png {{cannabinoids_figures}}

    cp {{psilocybin_project}}/figures/motion.png {{psilocybin_figures}}
    cp {{psilocybin_project}}/figures/correlation-analysis/group-level_correlation-matrices_acute.png {{psilocybin_figures}}
    cp {{psilocybin_project}}/figures/correlation-analysis/group-level_correlation-matrices_longitudinal.png {{psilocybin_figures}}
    cp {{psilocybin_project}}/figures/connectivity-timeseries/connectivity_timeseries_dose_response.png {{psilocybin_figures}}
    cp {{psilocybin_project}}/figures/connectivity-timeseries/connectivity_timeseries_chemical_control_vh.png {{psilocybin_figures}}
    cp {{psilocybin_project}}/figures/connectivity-timeseries/connectivity_timeseries_chemical_control_mdl.png {{psilocybin_figures}}
    cp {{psilocybin_project}}/figures/rcbv/cbv_dose_response.png {{psilocybin_figures}}
    cp {{psilocybin_project}}/figures/rcbv/cbv_chemical_control.png {{psilocybin_figures}}
    inkscape {{psilocybin_figures}}/group-level_correlation-matrices.svg -o {{psilocybin_figures}}/group-level_correlation-matrices.png -D -d 300
    cp {{psilocybin_project}}/figures/summary.png {{psilocybin_figures}}

    cp {{psilocybin_project}}/figures/tracking-vs-tissuevel/bad_tissuevel_example.png {{methods_figures}}
    cp {{psilocybin_project}}/figures/tracking-vs-tissuevel/tracking_vs_tissuevel_discrepancy_example.png {{methods_figures}}
    cp {{psilocybin_project}}/figures/tracking-vs-tissuevel/mouse_vs_brain_velocity_correlation.png {{methods_figures}}

