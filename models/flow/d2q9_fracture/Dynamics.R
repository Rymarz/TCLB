# Density - table of variables of LB Node to stream
#  name - variable name to stream
#  dx,dy,dz - direction of streaming
#  comment - additional comment

AddDensity(name = "f[0]", dx = 0, dy = 0, group = "f")
AddDensity(name = "f[1]", dx = 1, dy = 0, group = "f")
AddDensity(name = "f[2]", dx = 0, dy = 1, group = "f")
AddDensity(name = "f[3]", dx = -1, dy = 0, group = "f")
AddDensity(name = "f[4]", dx = 0, dy = -1, group = "f")
AddDensity(name = "f[5]", dx = 1, dy = 1, group = "f")
AddDensity(name = "f[6]", dx = -1, dy = 1, group = "f")
AddDensity(name = "f[7]", dx = -1, dy = -1, group = "f")
AddDensity(name = "f[8]", dx = 1, dy = -1, group = "f")

AddDensity(name = "h", dx = 0, dy = 0, group = "HZ")

AddDensity(name = "c[0]", dx = 0, dy = 0, group = "c")
AddDensity(name = "c[1]", dx = 1, dy = 0, group = "c")
AddDensity(name = "c[2]", dx = 0, dy = 1, group = "c")
AddDensity(name = "c[3]", dx = -1, dy = 0, group = "c")
AddDensity(name = "c[4]", dx = 0, dy = -1, group = "c")
AddDensity(name = "c[5]", dx = 1, dy = 1, group = "c")
AddDensity(name = "c[6]", dx = -1, dy = 1, group = "c")
AddDensity(name = "c[7]", dx = -1, dy = -1, group = "c")
AddDensity(name = "c[8]", dx = 1, dy = -1, group = "c")

# AddField(name="f[1]", dx=1);

# THIS QUANTITIES ARE NEEDED FOR PYTHON INTEGRATION EXAMPLE
# COMMENT OUT FOR PERFORMANCE
# If present thei are used:
# As VelocityX/Y for Boundary conditions
# As mass force (+ GravitationX/Y) in fluid
if (Options$bc) {
    AddDensity(name = "BC[0]", group = "BC", parameter = TRUE)
    AddDensity(name = "BC[1]", group = "BC", parameter = TRUE)
}

# Quantities - table of fields that can be exported from the LB lattice (like density, velocity etc)
#  name - name of the field
#  type - C type of the field, "real_t" - for single/double float, and "vector_t" for 3D vector single/double float
# Every field must correspond to a function in "Dynamics.c".
# If one have filed [something] with type [type], one have to define a function:
# [type] get[something]() { return ...; }

AddQuantity(name = "Rho", unit = "kg/m2")
AddQuantity(name = "P", unit = "Pam")
AddQuantity(name = "Q", unit = "m2/s", vector = T)
AddQuantity(name = "H", unit = "m")
AddQuantity(name = "C", unit = "kg/m3")

# Stages
AddDensity(name = "Height_parameter", group = "init", parameter = TRUE)
AddDensity(name = "Concentration_param", group = "init", parameter = TRUE)
AddStage(name = "BaseIteration", main = "Run", load.densities = TRUE, save.fields = TRUE)
AddStage(name = "BaseInitFromFields", main = "InitFromFields", load.densities = TRUE, save.fields = TRUE)
AddStage(name = "BasehEvolution", main = "hEvolution", load.densities = TRUE, save.fields = TRUE)
AddAction(name = "Iteration", "BaseIteration")
AddAction(name = "InitFromFields", "BaseInitFromFields")
AddAction(name = "hEvolution", "BasehEvolution")

# Settings - table of settings (constants) that are taken from a .xml file
#  name - name of the constant variable
#  comment - additional comment
# You can state that another setting is 'derived' from this one stating for example: RelaxationRate='1.0/(3*Viscosity + 0.5)'

AddSetting(name = "RelaxationRate", S2 = "1-RelaxationRate", comment = "one over relaxation time")
AddSetting(name = "Viscosity", RelaxationRate = "1.0/(3*Viscosity + 0.5)", default = 0.16666666, comment = "viscosity")
AddSetting(name = "VelocityX", default = 0, comment = "inlet/outlet/init velocity", zonal = T)
AddSetting(name = "VelocityY", default = 0, comment = "inlet/outlet/init velocity", zonal = T)
AddSetting(name = "Pressure", default = 0, comment = "inlet/outlet/init density", zonal = T)
AddSetting(name = "GravitationX", default = 0, comment = "body/external acceleration", zonal = T)
AddSetting(name = "GravitationY", default = 0, comment = "body/external acceleration", zonal = T)

AddSetting(name = "S2", default = "0", comment = "MRT Sx")
AddSetting(name = "S3", default = "0", comment = "MRT Sx")
AddSetting(name = "S4", default = "0", comment = "MRT Sx")
AddSetting(name = "MagicNumber", default = 0.25, comment = "TRT magic number")

AddSetting(name = "Height", default = 1, zonal = TRUE)

# AddSetting(name = "ConcentrationRelaxationRate", SC2 = "1-ConcentrationRelaxationRate", default = 0, comment = "one over concentration relaxation time")
# AddSetting(name = "Diffusivity", ConcentrationRelaxationRate = "1.0/(3*Diffusivity+0.5)", default = 0.166666667, comment = "diffusivity")
AddSetting(name = "Diffusivity", default = 0.166666667, comment = "diffusivity")

AddSetting(name = "Concentration", default = 0, comment = "inlet/outlet/init concentration", zonal = T)
AddSetting(name = "Saturation", default = 1, comment = "Saturation concentration")
AddSetting(name = "ReactionConstant", default = 1, comment = "Reaction speed coefficient")
AddSetting(name = "SolidConcentration", default = 1, comment = "Solid concentration")
AddSetting(name = "Sherwood", default = 8, comment = "Sherwood number")
AddSetting(name = "hTimeStep", default = 1, comment = "h evolution time step in pseudo-steady state approach")


AddSetting(name = "SC2", default = "0", comment = "MRT concentration SCx")
AddSetting(name = "SC3", default = "0", comment = "MRT concentration SCx")
AddSetting(name = "SC4", default = "0", comment = "MRT concentration SCx")
AddSetting(name = "MagicNumber_D", default = 0.25, comment = "TRT concetration magic number")

# Globals - table of global integrals that can be monitored and optimized
AddGlobal(name = "PressureLoss", comment = "pressure loss", unit = "1mPa")
AddGlobal(name = "OutletFlux", comment = "pressure loss", unit = "1m2/s")
AddGlobal(name = "InletFlux", comment = "pressure loss", unit = "1m2/s")

# Node types for boundaries
AddNodeType(name = "EPressure", group = "BOUNDARY")
AddNodeType(name = "WPressure", group = "BOUNDARY")

AddNodeType(name = "NVelocity", group = "BOUNDARY")
AddNodeType(name = "SVelocity", group = "BOUNDARY")
AddNodeType(name = "WVelocity", group = "BOUNDARY")
AddNodeType(name = "EVelocity", group = "BOUNDARY")

AddNodeType(name = "NSymmetry", group = "BOUNDARY")
AddNodeType(name = "SSymmetry", group = "BOUNDARY")

AddNodeType(name = "WPressureWConcentration", group = "BOUNDARY")
AddNodeType(name = "EPressureEConcentration", group = "BOUNDARY")
AddNodeType(name = "WVelocityWConcentration", group = "BOUNDARY")
AddNodeType(name = "EVelocityEConcentration", group = "BOUNDARY")

AddNodeType(name = "Inlet", group = "OBJECTIVE")
AddNodeType(name = "Outlet", group = "OBJECTIVE")
AddNodeType(name = "Solid", group = "BOUNDARY")
AddNodeType(name = "Wall", group = "BOUNDARY")
AddNodeType(name = "MRT", group = "COLLISION")

AddNodeType(name = "Internal", group = "OBJECTIVE")