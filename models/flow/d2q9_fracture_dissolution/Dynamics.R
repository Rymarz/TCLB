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

AddDensity( name="h_Z", dx=0, dy=0, group="HZ")

# Stages
AddDensity(name="Height_parameter", group="init", parameter=TRUE)
AddStage(name="BaseIteration", main="Run", load.densities=TRUE, save.fields=TRUE) 
AddStage(name="BaseInitFromFields", main="InitFromFields", load.densities=TRUE, save.fields=TRUE)
AddAction(name="Iteration", "BaseIteration")
AddAction(name="InitFromFields", "BaseInitFromFields")

# Output quantieties
AddQuantity(name="Rho", unit="kg/m3")
AddQuantity(name="Pressure", unit="Pa")
AddQuantity(name="U", unit="m/s",vector=T)
AddQuantity(name="H_Z", unit="m")
AddQuantity(name="C", unit="1/m3")

# Settings
AddSetting(name="RelaxationRate", S2='1-RelaxationRate', comment='one over relaxation time')
AddSetting(name="Viscosity", RelaxationRate='1.0/(3*Viscosity + 0.5)', default=0.16666666, comment='viscosity')
AddSetting(name="VelocityX", default=0, comment='inlet/outlet/init velocity', zonal=T)
AddSetting(name="VelocityY", default=0, comment='inlet/outlet/init velocity', zonal=T)
AddSetting(name="Pressure", default=0, comment='inlet/outlet/init density', zonal=T)

AddSetting(name="GravitationX")
AddSetting(name="GravitationY")

AddSetting(name="S2", default="0", comment='MRT Sx')
AddSetting(name="S3", default="0", comment='MRT Sx')
AddSetting(name="S4", default="0", comment='MRT Sx')

AddSetting(name="nubuffer", default=0.01, comment='Viscosity in the buffer layer (cumulant)')

AddSetting(name="Height", default=1, zonal=TRUE) 
AddSetting(name="C_init", default=0, zonal=TRUE) 
AddSetting(name="omega_D", comment='Relaxation rate') 
AddSetting(name="D", omega_D='1.0/(3*D+0.5)', default=0.16666666, comment='Diffusivity') 
AddSetting(name="C_inlet", default=0.0)
AddSetting(name="C_outlet", default=0.0)
AddSetting(name="C_saturation", default=1)

AddSetting(name="k",default=1, comment='Reaction speed coefficient')
AddSetting(name="C_solid", default=100, comment='Solid concentration')

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

AddNodeType(name="NSymmetry", group="BOUNDARY")
AddNodeType(name="SSymmetry", group="BOUNDARY")

AddNodeType(name="Inlet", group="OBJECTIVE")
AddNodeType(name="Outlet", group="OBJECTIVE")
AddNodeType(name="Solid", group="BOUNDARY")
AddNodeType(name="Wall", group="BOUNDARY")
AddNodeType(name="MRT", group="COLLISION")
AddNodeType(name="Reaction", group="SOURCE")
