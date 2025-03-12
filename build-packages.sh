dotnet restore src/Veldrid.sln
dotnet restore src/Veldrid.sln

export UseStableVersions=true

rm -r bin/Packages/*

pack_and_release() {
  echo "Packing $2 ($1)"
  dotnet pack -c $1 "src/$2/$2.csproj"
}

pack_and_release_all() {
  pack_and_release $1 Veldrid.OpenGLBindings
  pack_and_release $1 Veldrid.MetalBindings
  pack_and_release $1 Veldrid
  pack_and_release $1 Veldrid.Utilities
  pack_and_release $1 Veldrid.ImGui
  pack_and_release $1 Veldrid.ImageSharp
  pack_and_release $1 Veldrid.SDL2
  pack_and_release $1 Veldrid.StartupUtilities
  #pack_and_release $1 Veldrid.VirtualReality
  #pack_and_release $1 Veldrid.RenderDoc
}

pack_and_release_all Release
