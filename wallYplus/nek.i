[Mesh]
  type = NekRSMesh
  boundary = 1
[]

[Problem]
  type = NekRSStandaloneProblem
  casename = 'tjunction'
[]


[Executioner]
  type = Transient

  [TimeStepper]
    type = NekTimeStepper
  []
[]

# BC IDS
# 1 = main line inlet
# 2 = side line inlet
# 3 = side line outlet
# 4 = main line outlet
# 5 = wall

[Postprocessors]

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
