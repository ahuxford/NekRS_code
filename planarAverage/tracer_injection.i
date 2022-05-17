[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 1
  ny = 1
[]

[Variables]
  [./u]
  [../]
[]

[Kernels]
  [./diff]
    type = NullKernel
    variable = u
  [../]
[]

[Executioner]
  type = Transient
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
  nl_abs_tol = 1e-10
[]


[Functions]
  [./tracer_injection]
    type = PiecewiseLinear
    data_file = ../../SamAlone/WM1_data.csv
    format = columns
  [../]
[]

[Postprocessors]
  [toNekRS_scalar3]
    type = FunctionValuePostprocessor
    function = tracer_injection
    execute_on = 'INITIAL TIMESTEP_BEGIN'
  []
[]

[Outputs]
  print_linear_residuals = false
  perf_graph = true
  [./csv]
    type = CSV
  [../]
  [./console]
    type = Console
  [../]
[]
