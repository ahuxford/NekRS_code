[Mesh]
  type = NekRSMesh
  boundary = 2
[]

[Problem]
  type = NekRSSeparateDomainProblem

  casename = 'tjunction'

  coupling_type = 'inlet outlet'
  coupled_scalars = 'scalar03'

  inlet_boundary  = '2'  # boundary ID for NekRS  inlet
  outlet_boundary = '3'  # boundary ID for NekRS outlet
[]


[Executioner]
  type = Transient

  [TimeStepper]
    type = NekTimeStepper
  []
[]

[MultiApps]
  [sub]
    type = TransientMultiApp
    app_type = CardinalApp
    input_files = 'tracer_injection.i'
    max_procs_per_app = 1
  []
[]

[Transfers]
  [toNekRS_scalar3_trans]
    type = MultiAppPostprocessorTransfer
    multi_app = sub
    direction = from_multiapp
    reduction_type = average
    from_postprocessor = toNekRS_scalar3
    to_postprocessor   = inlet_S03
  []
[]

# BC IDS
# 1 = main line inlet
# 2 = side line inlet
# 3 = side line outlet
# 4 = main line outlet
# 5 = wall

[Postprocessors]

  [SideLine_in_S03]
    type = NekSideAverage
    field = scalar03
    boundary = '2'
  []

  [max_S03]
    type = NekVolumeExtremeValue
    field = scalar03
    value_type = max
  []

  [min_S03]
    type = NekVolumeExtremeValue
    field = scalar03
    value_type = min
  []

# for concentration integral???
  [SideLine_Wghtin_S03]
    type = NekMassFluxWeightedSideAverage
    field = scalar03
    boundary = '2'
  []

  [SideLine_Int_S03]
    type = NekSideIntegral
    field = scalar03
    boundary = '2'
  []

  [SideLine_Avg_S03]
    type = NekSideAverage
    field = scalar03
    boundary = '2'
  []

  [m_in_main]
    type = NekMassFluxWeightedSideIntegral
    field = unity
    boundary = '1'
  []
  [m_in_side]
    type = NekMassFluxWeightedSideIntegral
    field = unity
    boundary = '2'
  []
  [m_out_main]
    type = NekMassFluxWeightedSideIntegral
    field = unity
    boundary = '4'
  []
  [m_out_side]
    type = NekMassFluxWeightedSideIntegral
    field = unity
    boundary = '3'
  []

[]


[Outputs]
  csv = true
[]
