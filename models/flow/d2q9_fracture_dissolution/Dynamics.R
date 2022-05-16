# Densieties and fields
AddDensity( name="f[0]", dx= 0, dy= 0, group="f")
AddDensity( name="f[1]", dx= 1, dy= 0, group="f")
AddDensity( name="f[2]", dx= 0, dy= 1, group="f")
AddDensity( name="f[3]", dx=-1, dy= 0, group="f")
AddDensity( name="f[4]", dx= 0, dy=-1, group="f")
AddDensity( name="f[5]", dx= 1, dy= 1, group="f")
AddDensity( name="f[6]", dx=-1, dy= 1, group="f")
AddDensity( name="f[7]", dx=-1, dy=-1, group="f")
AddDensity( name="f[8]", dx= 1, dy=-1, group="f")

AddDensity( name="c[0]", dx= 0, dy= 0, group="c")
AddDensity( name="c[1]", dx= 1, dy= 0, group="c")
AddDensity( name="c[2]", dx= 0, dy= 1, group="c")
AddDensity( name="c[3]", dx=-1, dy= 0, group="c")
AddDensity( name="c[4]", dx= 0, dy=-1, group="c")
AddDensity( name="c[5]", dx= 1, dy= 1, group="c")
AddDensity( name="c[6]", dx=-1, dy= 1, group="c")
AddDensity( name="c[7]", dx=-1, dy=-1, group="c")
AddDensity( name="c[8]", dx= 1, dy=-1, group="c")

AddDensity( name="h", dx=0, dy=0, group="HZ")

# Stages
AddDensity(name="Height_parameter", group="init", parameter=TRUE)
AddStage(name="BaseIteration", main="Run", load.densities=TRUE, save.fields=TRUE) 
AddStage(name="BaseInitFromFields", main="InitFromFields", load.densities=TRUE, save.fields=TRUE)
AddAction(name="Iteration", "BaseIteration")
AddAction(name="InitFromFields", "BaseInitFromFields")

# Output quantieties
AddQuantity(name="Rho", unit="kg/m3")
AddQuantity(name="P", unit="Pa")
AddQuantity(name="U", unit="m/s",vector=T)
AddQuantity(name="H", unit="m")
AddQuantity(name="C", unit="kg/m3")

# Settings
AddSetting(name="RelaxationRate", S2='1-RelaxationRate', comment='one over relaxation time')
AddSetting(name="Viscosity", RelaxationRate='1.0/(3*Viscosity + 0.5)', default=0.166666667, comment='viscosity')
AddSetting(name="VelocityX", default=0, comment='inlet/outlet/init velocity', zonal=T)
AddSetting(name="VelocityY", default=0, comment='inlet/outlet/init velocity', zonal=T)
AddSetting(name="Pressure", default=0, comment='inlet/outlet/init density', zonal=T)
AddSetting(name="GravitationX",default=0, comment='body/external acceleration', zonal=TRUE)
AddSetting(name="GravitationY",default=0, comment='body/external acceleration', zonal=TRUE)

AddSetting(name="S2", default="0", comment='MRT Sx')
AddSetting(name="S3", default="0", comment='MRT Sx')
AddSetting(name="S4", default="0", comment='MRT Sx')

AddSetting(name="nubuffer", default=0.01, comment='Viscosity in the buffer layer (cumulant)')

AddSetting(name="Height", default=1, zonal=TRUE) 

AddSetting(name="ConcentrationRelaxationRate", SC2="1-ConcentrationRelaxationRate", default=0, comment='one over concentration relaxation time')
AddSetting(name="Diffusivity",  ConcentrationRelaxationRate="1.0/(3*Diffusivity+0.5)", default=0.166666667, comment='diffusivity') 
AddSetting(name="Concentration", default=0, comment='inlet/outlet/init concentration', zonal=T)
AddSetting(name="Saturation", default=1)
AddSetting(name="k",default=1, comment='Reaction speed coefficient')
AddSetting(name="SolidConcentration", default=100, comment='Solid concentration')

AddSetting(name="SC2", default="0", comment='MRT concentration Sx')
AddSetting(name="SC3", default="0", comment='MRT concentration Sx')
AddSetting(name="SC4", default="0", comment='MRT concentration Sx')
AddSetting(name="MagicNumber_D", default=0.25, comment='TRT concetration magic number')

 
# AddSetting(name="ConcentrationRelaxationRate_even", default=0, comment='TRT even concetration relaxation rate')
# AddSetting(name="ConcentrationRelaxationRate_odd", ConcentrationRelaxationRate_even="(1.0 - 0.5*ConcentrationRelaxationRate_odd)/((MagicNumber_D-0.25)*ConcentrationRelaxationRate_odd + 0.5)", default=0, comment='TRT odd concetration relaxation rate')

# AddSetting(name="SC_odd", default="0", comment='MRT CSx')
# AddSetting(name="Diffusivity",  ConcentrationRelaxationRate='1.0/(3*Diffusivity+0.5)', default=0.16666666, comment='Diffusivity') 
# AddSetting(name="Diffusivity",  ConcentrationRelaxationRate_odd="1.0/(3*Diffusivity+0.5)", default=0.16666666, comment='Diffusivity') 


# Globals - table of global integrals that can be monitored and optimized
AddGlobal(name="PressureLoss", comment='pressure loss', unit="1mPa") 
AddGlobal(name="OutletFlux", comment='pressure loss', unit="1m2/s")
AddGlobal(name="InletFlux", comment='pressure loss', unit="1m2/s")

# Node types for boundaries
AddNodeType(name="EPressure", group="BOUNDARY")
AddNodeType(name="WPressure", group="BOUNDARY")

AddNodeType(name="NVelocity", group="BOUNDARY")
AddNodeType(name="SVelocity", group="BOUNDARY")
AddNodeType(name="WVelocity", group="BOUNDARY")
AddNodeType(name="EVelocity", group="BOUNDARY")

AddNodeType(name="WPressureWConcentration", group="BOUNDARY")
AddNodeType(name="EPressureEConcentration", group="BOUNDARY")
AddNodeType(name="WVelocityWConcentration", group="BOUNDARY")

AddNodeType(name="NSymmetry", group="BOUNDARY")
AddNodeType(name="SSymmetry", group="BOUNDARY")

AddNodeType(name="Inlet", group="OBJECTIVE")
AddNodeType(name="Outlet", group="OBJECTIVE")
AddNodeType(name="Solid", group="BOUNDARY")
AddNodeType(name="Wall", group="BOUNDARY")
AddNodeType(name="MRT", group="COLLISION")
AddNodeType(name="IncompressibleSRT", group="COLLISION")
AddNodeType(name="IncompressibleMRT", group="COLLISION")
AddNodeType(name="Reaction", group="SOURCE")
